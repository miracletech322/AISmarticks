@if(isset($template))
    <div id="prev_template-container">
        <div class="prev-whatsapp-header">
            <span class="prev_whatsapp-name">{{ $template['name'] }}</span>
        </div>
        <div class="prev_whatsapp-chat">
            <span class="prev_whatsapp-id">{{ $template['id'] }}</span>
            @if(isset($template['components']))
                <div class="card prev_whatsapp-card">
                    @foreach($template['components'] as $component)
                        @switch(strtolower($component['type']))
                            @case('header')
                                @switch(strtolower($component['format']))
                                    @case('text')
                                        <b>{!! nl2br($component['text']) !!}</b><br><br>
                                        @break
                                    @case('image')
                                        <div class="prev_whatsapp-card_file-block @if(isset($component['example']['header_handle'])) has-example @endif">
                                            @if(isset($component['example']['header_handle']))
                                                <img src="{{ $component['example']['header_handle'][0] }}" style="width: 100%;border-radius: 5px" alt="Image">
                                            @else
                                                <div>{{ __('Image File') }}</div>
                                            @endif
                                        </div>
                                        @break
                                    @case('document')
                                        <div class="prev_whatsapp-card_file-block prev_whatsapp-doc">
                                            <div class="prev-whatsapp-example-document">{{ __('Document Example') }}</div>
                                        </div>
                                        @break
                                    @case('video')
                                        <div class="prev_whatsapp-card_file-block prev_whatsapp-video @if(isset($component['example']['header_handle'])) has-example @endif">
                                            @if(isset($component['example']['header_handle']))
                                                <video style="width: 100%;border-radius: 5px" controls>
                                                    <source src="{{ $component['example']['header_handle'][0] }}" type="video/mp4">
                                                    Your browser does not support the video tag.
                                                </video>
                                            @else
                                                <div>{{ __('Video File') }}</div>
                                            @endif
                                        </div>
                                @endswitch
                                @break
                            @case('body')
                                {!! nl2br($component['text']) !!}<br><br>
                                @break
                            @case('footer')
                                <span style="font-size: small;color: grey;">{!! nl2br($component['text']) !!}</span><br>
                                <br>
                                @break
                            @case('buttons')
                                {{ $wtButtons = $component }}
                        @endswitch
                    @endforeach
                    <div class="prev_whatsapp_datetime">
                        <span>{{ date("h:i a") }}</span>
                    </div>
                </div>
                @if(isset($wtButtons))
                        <div class="prev_whatsapp-buttons"></div>
                @endif

            @endif

        </div>
    </div>
@endif

<style>
    #prev_template-container {
        max-height: 100%;
    }

    #prev_template-container .prev-whatsapp-header .prev_whatsapp-name {
        font-size: large;
    }

    #prev_template-container .prev-whatsapp-header {
        display: flex;
        justify-content: space-between;
        height: 22px;
        width: calc(100% - 20px);
        padding: 5px 10px;
        margin-bottom: 5px;
        border-radius: 5px;
    }

    #prev_template-container .prev_whatsapp-chat {
        width: calc(100% - 50px);
        height: fit-content;
        display: flex;
        flex-direction: column;
        background-image: url("/img/whatsapp-chat-background.jpeg");
        background-size: 100% auto;
        background-position: center;
        padding: 50px 25px 25px;
        border-radius: 7px;
        position: relative;
        /*min-height: calc(100% - 85px);*/
    }

    #prev_template-container .prev_whatsapp-card {
        -webkit-box-shadow: 7px 6px 5px -4px rgba(161,161,161,1);
        -moz-box-shadow: 7px 6px 5px -4px rgba(161,161,161,1);
        box-shadow: 7px 6px 5px -4px rgba(161,161,161,1);
        background: #fff;
        width: fit-content;
        padding: 5px;
        border-radius: 7px;
        min-width: 150px;
        max-width: 350px;
    }

    #prev_template-container .prev_whatsapp_datetime {
        position: relative;
    }

    #prev_template-container .prev_whatsapp_datetime span {
        position: absolute;
        right: 5px;
        bottom: 0;
        font-size: small;
        color: grey;
    }

    #prev_template-container .prev_whatsapp-card_file-block:not(.has-example),
    #prev_template-container .prev_whatsapp-card_file-block.prev_whatsapp-doc {
        width: 100%;
        height: 100px;
        background: lightgrey;
        border-radius: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #prev_template-container .prev_whatsapp-id {
        position: absolute;
        top: 5px;
        display: block;
        width: fit-content;
        font-size: small;
        right: 10px;
        padding: 5px 10px 3px;
        border-radius: 3px;
        background: #fff;
        margin: 10px;
        -webkit-box-shadow: inset 2px 2px 5px 0 rgba(161,161,161,1);
        -moz-box-shadow: inset 2px 2px 5px 0 rgba(161,161,161,1);
        box-shadow: inset 2px 2px 5px 0 rgba(161,161,161,1);
    }

    @media (max-width:601px) {
        #prev_template-container .prev-whatsapp-header {
            flex-direction: column;
        }

        #prev_template-container .prev-whatsapp-header .prev_whatsapp-name {
            font-size: medium
        }

        /*#prev_template-container .prev_whatsapp-chat {*/
        /*    margin-top: 25px;*/

        /*}*/
    }
</style>