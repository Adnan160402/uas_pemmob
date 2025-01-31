<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Filament\Admin\Resources\IdolResource\Api\Handlers\CreateHandler;
use App\Filament\Admin\Resources\IdolResource\Api\Handlers\DeleteHandler;
use App\Filament\Admin\Resources\IdolResource\Api\Handlers\DetailHandler;
use App\Filament\Admin\Resources\IdolResource\Api\Handlers\PaginationHandler;
use App\Filament\Admin\Resources\IdolResource\Api\Handlers\UpdateHandler;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('idols')->group(function () {
    Route::post('/', [CreateHandler::class, 'handler'])->name('api.idols.create');
    Route::get('/', [PaginationHandler::class, 'handler'])->name('api.idols.list');
    Route::get('/{id}', [DetailHandler::class, 'handler'])->name('api.idols.detail');
    Route::put('/{id}', [UpdateHandler::class, 'handler'])->name('api.idols.update');
    Route::delete('/{id}', [DeleteHandler::class, 'handler'])->name('api.idols.delete');
});
