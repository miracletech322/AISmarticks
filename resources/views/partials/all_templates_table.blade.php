@if(isset($templates))
    <table id="templates-table" class="table templates-table" data-mailbox="{{ $mailbox }}">
        <thead>
        <tr>
            <th>{{ __('ID') }}</th>
            <th>{{ __('Template name') }}</th>
            <th>{{ __('Category') }}</th>
            <th>{{ __('Status') }}</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
			@if(isset($templates))
				@foreach($templates as $template)
					<tr>
						<td class="ttable-td" style="padding-left: 10px!important;">{{ $template['id'] }}</td>
						<td class="ttable-td">
							<span>{{ $template['name'] }}</span>
							<div class="templates-table_small">
								<span>{{ $template['id'] }}</span>
								<span class="status_{{ $template['status'] }}">{{ $template['status'] }}</span>
							</div>
						</td>
						<td>{{ $template['category'] }}</td>
						<td class="tb_status"><span class="status_{{ $template['status'] }}">{{ $template['status'] }}</span></td>
						<td style="vertical-align: middle;">
							<div class="templates-crud">
								<a href="#" data-trigger="modal" data-modal-title="{{ __('View Template') }}" data-modal-size="lg" data-modal-no-footer="true" data-modal-body='<iframe src="{{ route('whatsapp.view_template', ['x_embed' => 1, 'template_id' => $template['id'], 'mailbox' => $mailbox]) }}" frameborder="0" class="modal-iframe"></iframe>' style="margin-right: 3px;border-right: 1px solid grey;padding-right: 5px;"><i class="glyphicon glyphicon-eye-open"></i></a>
								<span class="template-edit" title="{{ __('Duplicate & edit') }}" style="margin-right: 3px;border-right: 1px solid grey;padding-right: 5px;"><i class="glyphicon glyphicon-edit"></i></span>
								<span class="template-delete" title="{{ __('Delete Template') }}"><i class="glyphicon glyphicon-remove" style="color: red"></i></span>
							</div>
						</td>
					</tr>
				@endforeach
			@endif
        </tbody>
    </table>
    <style>
        table > thead {
            background-color: #deecf9;
        }
        table.table thead th {
            padding: 4px 13px 1px 13px;
            white-space: nowrap;
            border-bottom: 1px solid #e3e8eb;
        }
        table tbody tr {
            background-color: #f4f8fd;
        }
        table tbody tr td {
            padding: 5px 5px!important;
        }

        td.tb_status {
            padding: 10px 0!important;
        }
        .tb_status span {
            font-size: 12px!important;
            border-radius: 3px;
            padding: 2px 5px;
            color: #fff;
        }

        .status_rejected {
            background: #ee3f3f;
        }

        .status_approved {
            background: #2a9f28;
        }
        #delete-template_modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .template-delete,
        .template-edit {
            cursor: pointer;
        }

        #templates-table .templates-table_small {
            display: none;
        }

        #templates-table.templates-table .ttable-td {
            overflow: hidden;
            white-space: nowrap;
            -webkit-mask-image: linear-gradient(to right, black 90%, transparent);
            mask-image: linear-gradient(to right, black 90%, transparent);
        }

        @media (max-width:1170px) {
            #templates-table.templates-table {
                table-layout: fixed;
            }
        }

        @media (max-width:767px) {
            #templates-table thead tr th:nth-child(1),
            #templates-table tbody tr td:nth-child(1),
            #templates-table thead tr th:nth-child(3),
            #templates-table tbody tr td:nth-child(3),
            #templates-table thead tr th:nth-child(4),
            #templates-table tbody tr td:nth-child(4) {
                display: none;
            }

            #templates-table.templates-table {
                table-layout: unset;
            }

            #templates-table .templates-table_small span:first-child {
                display: inline-block;
                font-size: x-small;
                border: 1px solid grey;
                border-radius: 5px;
                margin-right: 5px;
                padding: 3px 5px 2px;
                color: grey;
            }

            #templates-table .templates-table_small span:nth-child(2) {
                font-size: 12px !important;
                border-radius: 3px;
                padding: 2px 5px;
                color: #fff;
            }
            #templates-table .templates-table_small {
                display: flex;
            }
        }
    </style>

@else
    @include('partials/empty', ['empty_text' => __('There are no conversations here')])
@endif