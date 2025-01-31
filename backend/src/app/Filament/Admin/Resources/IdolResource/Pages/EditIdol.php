<?php

namespace App\Filament\Admin\Resources\IdolResource\Pages;

use App\Filament\Admin\Resources\IdolResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditIdol extends EditRecord
{
    protected static string $resource = IdolResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
