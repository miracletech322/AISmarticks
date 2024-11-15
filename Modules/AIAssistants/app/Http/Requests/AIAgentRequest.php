<?php

namespace Modules\AIAssistant\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

/**
 * AI Agent Request
 *
 * @author [Your Name]
 */
class AIAgentRequest extends FormRequest
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
           'name' =>'required|string|max:255',
            'openai_api_key' =>'required|string|min:32|max:64', // OpenAI API key length validation
        'model' =>'required|string|in:gpt-3.5-turbo,gpt-4', // Validation for supported GPT models
        'system_prompt' => 'nullable|string|max:2048', // System prompt length validation
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
           'name.required' => 'AI Agent name is required.',
            'openai_api_key.required' => 'OpenAI API Key is required.',
        'model.required' => 'Model is required.',
        'model.in' => 'Only gpt-3.5-turbo and gpt-4 models are supported.',
        ];
    }

    /**
     * Sanitize input data
     *
     * @return array
     */
    public function sanitizedArray()
    {
        $sanitized = [];
        $input = $this->all();

        $sanitized['name'] = trim($input['name']);
        $sanitized['openai_api_key'] = trim($input['openai_api_key']);
        $sanitized['model'] = trim($input['model']);
        $sanitized['system_prompt'] = trim($input['system_prompt'] ?? '');

        return $sanitized;
    }
}