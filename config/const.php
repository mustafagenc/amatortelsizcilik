<?php
return [

    'cache_sec_general'         => 300,
    'cache_sec_questions'       => 3600,
    'cache_sec_pages'           => 3600,
    'cache_sec_search_result'   => 7200,


    'share_image'               => app()->runningInConsole() ? '' : asset('images/share.png'),
    'share_image_dimensions'    => ['height' => 630, 'width' => 1200]

];
