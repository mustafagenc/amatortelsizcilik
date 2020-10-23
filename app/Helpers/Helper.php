<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Cache;

use App\Models\Dictionary;

class Helper
{
    public static function replace_tags(string $text)
    {
        $dictionary_list = Cache::remember('dictionary', 60, function () {
            return Dictionary::get();
        });

        $t_qcodes = [];
        $h_qcodes = [];

        foreach($dictionary_list as $dictionary) {
            array_push($t_qcodes, $dictionary->code);
            array_push($h_qcodes, str_replace($dictionary->code, '<abbr data-toggle="popover" data-content="<b>Soru:</b> ' . $dictionary->question . '<br /><b>Cevap:</b> ' . $dictionary->answer . '" data-trigger="hover">' . $dictionary->code . '</abbr>' , $dictionary->code));
        }

        $text = str_replace($t_qcodes, $h_qcodes, $text);
        return $text;
    }

}
