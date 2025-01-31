<?php
namespace App\Filament\Admin\Resources\IdolResource\Api\Handlers;

use Illuminate\Http\Request;
use Rupadana\ApiService\Http\Handlers;
use App\Filament\Admin\Resources\IdolResource;
use App\Filament\Admin\Resources\IdolResource\Api\Requests\CreateIdolRequest;

class CreateHandler extends Handlers {
    public static string | null $uri = '/';
    public static string | null $resource = IdolResource::class;

    public static function getMethod()
    {
        return Handlers::POST;
    }

    public static function getModel() {
        return static::$resource::getModel();
    }

    /**
     * Create Idol
     *
     * @param CreateIdolRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function handler(CreateIdolRequest $request)
    {
        $model = new (static::getModel());

        $model->fill($request->all());

        $model->save();

        return static::sendSuccessResponse($model, "Successfully Create Resource");
    }
}