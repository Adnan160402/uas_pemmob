<?php
namespace App\Filament\Admin\Resources\IdolResource\Api\Transformers;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Idol;

/**
 * @property Idol $resource
 */
class IdolTransformer extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->resource->toArray();
    }
}
