<?php

namespace App\Filament\Admin\Resources\IdolResource\Api\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateIdolRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
			'nama' => 'required|string',
			'date' => 'required|date',
			'venue' => 'required|string',
			'city' => 'required|string',
			'country' => 'required|string'
		];
    }
}
