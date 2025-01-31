<?php
namespace App\Filament\Admin\Resources\IdolResource\Api;

use Rupadana\ApiService\ApiService;
use App\Filament\Admin\Resources\IdolResource;
use Illuminate\Routing\Router;


class IdolApiService extends ApiService
{
    protected static string | null $resource = IdolResource::class;

    public static function handlers() : array
    {
        return [
            Handlers\CreateHandler::class,
            Handlers\UpdateHandler::class,
            Handlers\DeleteHandler::class,
            Handlers\PaginationHandler::class,
            Handlers\DetailHandler::class
        ];

    }
}
