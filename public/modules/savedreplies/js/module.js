/**
 * Module's JavaScript.
 */

// Saved Replies button in reply editor
var EditorSavedRepliesButton = function (context) {
	var ui = $.summernote.ui;

 	//var items = [];
 	// $('.sr-dropdown-list:first li').each(function(i, el) {
 	// 	items.push({
 	// 		value: $(el).attr('data-id'),
	 //        text: $(el).text(),
	 //        is_parent: $(el).attr('data-is-parent')
 	// 	});
 	// });

	// create button
	var button = ui.buttonGroup([
		// We have to create button inside button group to have tooltip separate for button
	    ui.button({
	        className: 'dropdown-toggle',
	        contents: '<i class="glyphicon glyphicon-comment"></i>',
	        tooltip: Lang.get("messages.saved_replies"),
	        container: 'body',
	        data: {
	            toggle: 'dropdown'
	        },
	        click: function(e) {

	        	if (typeof(e.target) == "undefined") {
	        		return;
	        	}

	        	var trigger = $(e.target);

	        	if (trigger.hasClass('glyphicon')) {
	        		trigger = trigger.parent();
	        	}

	        	setTimeout(function() {
					trigger.next().children().find('.sr-li-search:first .form-control:first').focus();
				}, 100);
	        }
	    }),
	    ui.dropdown({
	        className: 'dropdown-menu-right dropdown-saved-replies',
	        //checkClassName: ui.options.icons.menuCheck,
	        //items: items,
	        contents: $('#sr-dropdown-list').html(),
	        /*template: function (item) {
	            var html = item.text;
	            if (item.is_parent == '1') {
	            	html += ' <span class="caret"></span>';
	            }
	            return html;
	        },*/
	        click: function(e) {

	        	if (typeof(e.target) == "undefined") {
	        		return;
	        	}
	        	
	        	var target = $(e.target);

	        	if ($(e.target).hasClass('caret')) {
	        		target = target.parent();
	        	}

	        	if ($(e.target).hasClass('sr-li-search') || $(e.target).parent().hasClass('sr-li-search')) {
	        		e.stopPropagation();
	        		return false;
	        	}

	        	var saved_reply_id = target.attr('data-value');
	        	if (saved_reply_id) {
	        		if (target.children('.caret:first').length) {
	        			// Expand children
	        			target.parent().parent().children('li[data-parent-id="'+saved_reply_id+'"]').toggleClass('hidden');

	        			// Hide all children
	        			if (target.parent().parent().children('li[data-parent-id="'+saved_reply_id+'"]:first').hasClass('hidden')) {
		        			target.parent().parent().children('li[data-parents]:visible').each(function(index, el){
		        				var parents = $(el).attr('data-parents').split(',');
		        				for (var i in parents) {
									if (parents[i] == saved_reply_id) {
		        						$(el).addClass('hidden');
		        						return;
		        					}
		        				}
		        			});
		        		}
	        			e.stopPropagation();
	        		} else {
		        		// Load saved reply
		        		fsAjax({
								action: 'get',
								saved_reply_id: saved_reply_id,
								conversation_id: getGlobalAttr('conversation_id')
							}, 
							laroute.route('mailboxes.saved_replies.ajax'), 
							function(response) {
								if (typeof(response.status) != "undefined" && response.status == 'success' &&
									typeof(response.text) != "undefined" && response.text) 
								{
									$('#body').summernote('editor.restoreRange');
									// Remove wrapping div.
									// https://github.com/freescout-helpdesk/freescout/issues/2958
									//var text = response.text.replaceAll(/(^<div>|<\/div>$)/g, '');
									//context.invoke('editor.pasteHTML', text);
									//context.invoke('editor.pasteHTML', '<div>'+response.text+'</div>');
									context.invoke('editor.pasteHTML', response.text);
									//$('#body').summernote('pasteHTML', response.text);
									$('.form-reply:visible:first :input[name="saved_reply_id"]:first').val(saved_reply_id);
									// Show attachments
									if (response.attachments.length) {
										showAttachments(response);
									}
								} else {
									showAjaxError(response);
								}
								loaderHide();
							}
						);
					}
	        	} else {
	        		// Save this reply
	        		showModal({
	        			'remote': laroute.route('mailboxes.saved_replies.ajax_html', {'action': 'create'}),
	        			'size': 'lg',
	        			'title': Lang.get("messages.new_saved_reply"),
	        			'no_footer': true,
	        			'on_show': 'showSaveThisReply'
	        		});
	        	}

	        	e.preventDefault();
	        }
	    })
	]);

	var obj = button.render();

	// Add divider
	//obj.children().find('a[data-value="divider"]').parent().addClass('divider').children().first().remove();
	obj.children().find('.sr-li-search:first input:first').on("keyup", function() {
		srSearch($(this)[0]);
	});

	return obj;
}

var SrEditorAttachmentButton = function (context) {
	var ui = $.summernote.ui;

	// create button
	var button = ui.button({
		contents: '<i class="glyphicon glyphicon-paperclip"></i>',
		tooltip: Lang.get("messages.upload_attachments"),
		className: 'note-btn-attachment',
		container: 'body',
		click: function (e) {
			var att_container = $(e.target).parents('.form-group:first')
				.next()
				.children()
				.find('.sr-attachments-upload:first');

			var element = document.createElement('div');
			element.innerHTML = '<input type="file" multiple>';
			var fileInput = element.firstChild;

			fileInput.addEventListener('change', function() {
				if (fileInput.files) {
					for (var i = 0; i < fileInput.files.length; i++) {
						editorSendFile(fileInput.files[i], true, true, '', att_container);
		            }
			    }
			});

			fileInput.click();
		}
	});

	return button.render();   // return button as jquery object
}

fs_conv_editor_buttons['savedreplies'] = EditorSavedRepliesButton;
fs_conv_editor_toolbar[0][1].push('savedreplies');

function initSavedReplies()
{
	$(document).ready(function() {
		/*$('#saved-replies-index').sortable({
		    handle: '.handle',
		    forcePlaceholderSize: true 
		}).bind('sortupdate', function(e, ui) {
		    // ui.item contains the current dragged element.
		    var saved_replies = [];
		    $('#saved-replies-index > .panel').each(function(idx, el){
			    saved_replies.push($(this).attr('data-saved-reply-id'));
			});
			fsAjax({
					action: 'update_sort_order',
					saved_replies: saved_replies,
				}, 
				laroute.route('mailboxes.saved_replies.ajax'), 
				function(response) {
					showAjaxResult(response);
				}
			);
		});*/

		//summernoteInit('.saved-reply-text', {minHeight: 250, insertVar: true});

		// Update saved reply
		$('.saved-reply-save').click(function(e) {
			var saved_reply_id = $(this).attr('data-saved_reply_id');
			var name = $('#saved-reply-'+saved_reply_id+' :input[name="name"]').val();
			var button = $(this);
	    	var attachments_all = srMapInputToArray($(this).parents('.panel-body:first').children().find(':input[name="attachments_all[]"]'));
	    	var attachments = srMapInputToArray($(this).parents('.panel-body:first').children().find(':input[name="attachments[]"]'));

	    	button.button('loading');
			fsAjax({
					action: 'update',
					saved_reply_id: saved_reply_id,
					name: name,
					attachments_all: attachments_all,
					attachments: attachments,
					parent_saved_reply_id: $('#saved-reply-'+saved_reply_id+' :input[name="parent_saved_reply_id"]').val(),
					text: $('#saved-reply-'+saved_reply_id+' :input[name="text"]').val()
				}, 
				laroute.route('mailboxes.saved_replies.ajax'), 
				function(response) {
					if (typeof(response.status) != "undefined" && response.status == 'success' &&
						typeof(response.msg_success) != "undefined")
					{
						showFloatingAlert('success', response.msg_success);
						$('#saved-reply-'+saved_reply_id+' .panel-title a:first span:first span').text(name);

						if (typeof(response.refresh) != "undefined" && response.refresh) {
							window.location.href = '';
						}
					} else {
						showAjaxError(response);
					}
					button.button('reset');
					loaderHide();
				}
			);
		});

		// Delete saved reply
		$(".sr-delete-trigger").click(function(e){
			var button = $(this);

			showModalConfirm(Lang.get("messages.confirm_delete_saved_reply"), 'sr-delete-ok', {
				on_show: function(modal) {
					var saved_reply_id = button.attr('data-saved_reply_id');
					modal.children().find('.sr-delete-ok:first').click(function(e) {
						button.button('loading');
						modal.modal('hide');
						fsAjax(
							{
								action: 'delete',
								saved_reply_id: saved_reply_id
							}, 
							laroute.route('mailboxes.saved_replies.ajax'), 
							function(response) {
								showAjaxResult(response);
								button.button('reset');
								if ($('#saved-reply-'+saved_reply_id+' .panel-sortable:first').length) {
									window.location.href = '';
								} else {
									$('#saved-reply-'+saved_reply_id).remove();
								}
							}
						);
					});
				}
			}, Lang.get("messages.delete"));
			e.preventDefault();
		});

		// Sortable panels
		if ($('.saved-replies-tree').length) {
			var elements = sortable('.saved-replies-tree', {
			    handle: '.handle',
			    //forcePlaceholderSize: true 
			});
			for (var i in elements) {
				elements[i].addEventListener('sortupdate', function(e) {
				    // ui.item contains the current dragged element.
				    var saved_replies = [];
				    $(e.target).children('.panel').each(function(idx, el){
					    saved_replies.push($(this).attr('data-saved-reply-id'));
					});
					fsAjax({
							action: 'update_sort_order',
							saved_replies: saved_replies,
						}, 
						laroute.route('mailboxes.saved_replies.ajax'), 
						function(response) {
							showAjaxResult(response);
						}
					);
				});
			}
		}

		// On panel open
		$('.panel.panel-sortable').on('show.bs.collapse', function (e) {
		    summernoteInit('#'+e.currentTarget.id+' .saved-reply-text', {
		    	minHeight: 250,
		    	insertVar: true,
		    	toolbar: srGetEditorToolbar(),
				buttons: {
					insertvar: EditorInsertVarButton,
					attachment: SrEditorAttachmentButton,
					removeformat: EditorRemoveFormatButton,
					lists: EditorListsButton
				}
		    });
		})

		// Delete attachment
		$('li.attachment-loaded .glyphicon-remove').click(function(e) {
			removeAttachment($(this).parents('li.attachment-loaded:first').attr('data-attachment-id'));
		});
	});
}

function srGetEditorToolbar()
{
	var toolbar = JSON.parse(JSON.stringify(fs_conv_editor_toolbar));

	toolbar.push(['actions-select', ['insertvar']]);

	return fsApplyFilter('conversation.editor_toolbar', toolbar);
}

// Create saved reply
function initNewSavedReply(jmodal)
{
	$(document).ready(function(){
		var toolbar = fs_conv_editor_toolbar;
		summernoteInit('.modal-dialog .new-saved-reply-editor:visible:first textarea:first', {
			minHeight: 250,
			insertVar: true,
			toolbar: srGetEditorToolbar(),
			buttons: {
				insertvar: EditorInsertVarButton,
				attachment: SrEditorAttachmentButton,
				removeformat: EditorRemoveFormatButton,
				lists: EditorListsButton
			}
		});

		// Process save
		$('.modal-content .new-saved-reply-save:first').click(function(e) {
			var button = $(this);
	    	button.button('loading');
	    	var name = $(this).parents('.modal-content:first').children().find(':input[name="name"]').val();
	    	var text = $(this).parents('.modal-content:first').children().find(':input[name="text"]').val();
	    	var attachments_all = srMapInputToArray($(this).parents('.modal-content:first').children().find(':input[name="attachments_all[]"]'));
	    	var attachments = srMapInputToArray($(this).parents('.modal-content:first').children().find(':input[name="attachments[]"]'));
			fsAjax({
					action: 'create',
					mailbox_id: getGlobalAttr('mailbox_id'),
					from_reply: getGlobalAttr('conversation_id'),
					name: name,
					text: text,
					attachments_all: attachments_all,
					attachments: attachments,
					parent_saved_reply_id: $(this).parents('.modal-content:first').children().find(':input[name="parent_saved_reply_id"]').val(),
				}, 
				laroute.route('mailboxes.saved_replies.ajax'), 
				function(response) {
					if (typeof(response.status) != "undefined" && response.status == 'success' &&
						typeof(response.id) != "undefined" && response.id)
					{

						if (typeof(response.msg_success) != "undefined" && response.msg_success) {
							// Show alert (in conversation)
							jmodal.modal('hide');
							showFloatingAlert('success', response.msg_success);
							loaderHide();

							// Add newly created saved reply to the list
							var li_html = '<li><a href="#" data-value="'+response.id+'">'+htmlEscape(name)+'</a></li>';
							$('.form-reply:first:visible .dropdown-saved-replies:first').children('li:last').prev().before(li_html);
						} else {
							// Reload page (in saved replies list)
							window.location.href = '';
						}
					} else {
						showAjaxError(response);
						loaderHide();
						button.button('reset');
					}
				}
			);
		});
	});
}

function srMapInputToArray(inputs)
{
	return inputs.map(function() { return $(this).val(); } ).get();
}

// Display modal and show reply text
function showSaveThisReply(jmodal)
{
	// Show text
	$('.modal-dialog .new-saved-reply-editor:visible:first textarea[name="text"]:first').val(getReplyBody());
	initNewSavedReply(jmodal);
}

function srSearch(el)
{
	var expand_parents = [];
	var input = $(el);

	var q = input.val().toLowerCase();
	var lis = input.parents('.dropdown-saved-replies:first').children('li:gt(0)');
	var items = lis.find('a[data-value!=""]:not(.sr-cat)');

	if (q.length < 1) {
		// Show default items without parents
		lis.filter(':not([data-parents])').removeClass('hidden');
		lis.filter('[data-parents]').addClass('hidden');
	} else {
		// Filter
		$(items).each(function(i, el) {
			var item = $(el);
			if (item.text().toLowerCase().indexOf(q) != -1) {
				// Show item
				item.parent().removeClass('hidden');
				var data_parents = $(el).parent().attr('data-parents');

				if (data_parents) {
					var parents = data_parents.split(',');
					expand_parents = expand_parents.concat(parents);
				}
			} else {
				// Hide item
				item.parent().addClass('hidden');
			}
		});
		// Expand parents
		if (expand_parents.length) {
			var values = '';
			for (var i in expand_parents) {
				lis.find('a.sr-cat[data-value="'+expand_parents[i]+'"]').parent().removeClass('hidden');
			}
			// Collapse non-expanded parents
			$(lis.find('a.sr-cat')).each(function(i, el) {
				var cat = $(el);
				if (expand_parents.indexOf(cat.attr('data-value')) == -1 && !cat.hasClass('hidden')) {
					cat.parent().addClass('hidden');
				}
			});
		} else {
			lis.find('a.sr-cat').parent().addClass('hidden');
		}
	}
}