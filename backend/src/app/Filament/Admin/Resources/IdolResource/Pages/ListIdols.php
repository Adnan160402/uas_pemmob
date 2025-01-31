<?php

namespace App\Filament\Admin\Resources\IdolResource\Pages;

use App\Filament\Admin\Resources\IdolResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListIdols extends ListRecords
{
    protected static string $resource = IdolResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
