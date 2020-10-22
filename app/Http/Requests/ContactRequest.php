<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ContactRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'fullname' => 'required|max:255',
            'email' => 'required|email|max:255',
            'subject' => 'required|max:255',
            'message' => 'required',
            'g-recaptcha-response' => 'required|captcha',
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    // public function messages()
    // {
    //     return [
    //         'fullname.required' => 'A title is required',
    //         'message.required' => 'A message is required',
    //     ];
    // }

}
