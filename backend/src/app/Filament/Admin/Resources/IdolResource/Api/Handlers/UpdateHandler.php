<?php
namespace App\Filament\Admin\Resources\IdolResource\Api\Handlers;

use Illuminate\Http\Request;
use Rupadana\ApiService\Http\Handlers;
use App\Filament\Admin\Resources\IdolResource;
use App\Filament\Admin\Resources\IdolResource\Api\Requests\UpdateIdolRequest;

class UpdateHandler extends Handlers {
    public static string | null $uri = '/{id}';
    public static string | null $resource = IdolResource::class;

    public static function getMethod()
    {
        return Handlers::PUT;
    }

    public static function getModel() {
        return static::$resource::getModel();
    }


    /**
     * Update Idol
     *
     * @param UpdateIdolRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function handler(UpdateIdolRequest $request)
    {
        $id = $request->route('id');

        $model = static::getModel()::find($id);

        if (!$model) return static::sendNotFoundResponse();

        $model->fill($request->all());

        $model->save();

        return static::sendSuccessResponse($model, "Successfully Update Resource");
    }
}