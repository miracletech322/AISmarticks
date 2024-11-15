@if(isset($template))
    @if(isset($template['is_ready']))
        <div class="alert alert-success" style="margin-top: 15px;">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            {{ __('Template ready to send!') }}
        </div>
    @endif
    <div id="wtemplate_{{ $template['id'] }}" class="wtemplate">
        <h3>{{ $template['name'] }}</h3>
        @if (isset($template['components']))
            @foreach ($template['components'] as $c)
                @if (isset($c['text']))
                    <span class="wt-type">{{ $c['type'] }}:</span> {{ $c['text'] }}<br/>
                @elseif(isset($template['header']['need_files']))

                @else
                    {{ json_encode($c) }}<br/>
                @endif
            @endforeach
        @endif
    </div>
    @if (isset($template['params']))
        @foreach ($template['params'] as $pk=>$p)
            <div class="wtparams {{ $p }}">{{ $pk }}: <input type="text" name="wt_params_{{ $pk }}"/></div>
        @endforeach
    @endif

    @if(isset($template['header']['need_files']))
        <?php
            $fileType = '';
            if (strtolower($template['header']['format']) == 'document') {
                $fileType = 'application';
            }else {
                $fileType = $template['header']['format'];
            }

            $hasExample = false;
            if (isset($template['header']['files'])) {
                $hasExample = true;
            }

        ?>
        <div id="wt-header-files">
            <input type="hidden" name="wt_need_files" value="1">

            <div class="wt_files-or-example_block @if(!$hasExample) wt-hidden @endif">
                <button class="btn btn-primary active" data-file-type="0">{{ __('Use example') }}</button>
                <button class="btn btn-primary" data-file-type="1">{{ __('Select new file') }}</button>
                <input type="hidden" name="wt_file_type" value="@if($hasExample) 0 @else 1 @endif">
            </div>

            <div class="wtparams wt-new-file @if($hasExample) wt-hidden @endif">
                <span>{{ $template['header']['format'] }}: </span> <input type="file" name="wt_params_{{ $template['header']['format'] }}[]" accept="{{ $fileType }}/*" multiple/>
            </div>


            @if(isset($template['header']['files']))
                <div id="block-view-files" class="@if(!$hasExample) wt-hidden @endif">
                    <input type="hidden" name="wt_has_files_example" value="1">
                    @foreach($template['header']['files'][$template['header']['format']] as $key => $link)
                        <input type="hidden" name="wt_old_files[]" value="{{ $key }}">
                        @if(strtolower($template['header']['format']) == 'video')
                            <div class="wt-files_container wt-video  col-md-2" data-file-id="{{ $key }}">
                                <div class="wt-remove-file" title="{{ __('Remove file') }}"><span><i class="glyphicon glyphicon-remove"></i></span></div>
                                <video width="320" height="240" controls>
                                    <source src="{{ $link }}" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                            </div>
                        @elseif(strtolower($template['header']['format']) == 'image')
                            <div class="wt-files_container wt-image  col-md-2" data-file-id="{{ $key }}">
                                <div class="wt-remove-file" title="{{ __('Remove file') }}"><span><i class="glyphicon glyphicon-remove"></i></span></div>
                                <img src="{{ $link }}" alt="Image">
                            </div>
                        @elseif(strtolower($template['header']['format']) == 'document')
                            <div class="wt-files_container wt-document  col-md-2" data-file-id="{{ $key }}">
                                <span class="wt-document-header">{{ __('Document') }}</span>
                                <div class="wt-remove-file" title="{{ __('Remove file') }}"><span><i class="glyphicon glyphicon-remove"></i></span></div>
                                <button type="button" class="wt-save-file" data-wt-doc-link="{{ $link }}"><i class="glyphicon glyphicon-download-alt"></i></button>
                                <span class="wt-document_back"><i class="glyphicon glyphicon-file"></i></span>
                            </div>

                        @endif
                    @endforeach
                </div>
            @endif
        </div>
    @endif
@endif

<style>
    .wt-files_container:hover > .wt-remove-file:hover:active {
        transform: scale(0.9);
    }

    .wt-files_container:hover > .wt-remove-file:hover {
        transform: scale(1.1);
    }

    .wt-files_container:hover > .wt-remove-file {
        transition: .3s;
        display: flex;
    }

    .wt-files_container > .wt-remove-file {
        position: absolute;
        background: #93a1af;
        transition: .3s;
        text-align: center;
        cursor: pointer;
        font-weight: bold;
        width: 25px;
        height: 25px;
        display: none;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        top: 5px;
        right: 5px;
        z-index: 2;
    }

    .wt-files_container.wt-image img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }

    .wt-remove-file i {
        font-size: smaller;
    }

    .wt-remove-file span {
        margin-top: 2px;
        display: block;
    }

    .wt-files_container {
        position: relative;
        margin-top: 10px;
        margin-right: 5px;
        border: 1px solid darkgrey;
        padding: 0;
        overflow: hidden;
        align-items: center;
        display: flex;
        justify-content: center;
    }

    span.wt-type {
        padding: 0 6px;
        background: #808080b8;
        border-radius: 3px;
        color: #fff;
        display: inline-block;
        margin-bottom: 1px;
    }

    .wtparams span {
        margin-right: 5px;
    }

    .wtparams {
        display: flex;
        margin-top: 5px;
    }

    .wt-hidden {
        display: none!important;
    }

    .wt-files_container.wt-document button.wt-save-file {
        border: 0;
        background: #0078d7;
        color: #fff;
        padding: 5px 10px;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        transition: .3s;
        justify-content: center;
        align-items: center;
        z-index: 1;
    }

    .wt-files_container.wt-document:hover button.wt-save-file i {
        font-size: larger;
    }

    .wt-files_container.wt-document:hover button.wt-save-file {
        display: flex;
        transition: .3s;
    }

    .wt-files_container.wt-document {
        height: 100px;
        width: 100px;
        border-radius: 5px;
        background: #8080804a;
    }

    .wt-document-header {
        position: absolute;
        bottom: 9px;
        left: 50%;
        font-weight: bold;
        transform: translateX(-50%);
    }

    .wt-document_back i {
        font-size: x-large;
    }
</style>