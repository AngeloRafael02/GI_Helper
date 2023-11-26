import { Controller,Get,Param } from '@nestjs/common';
import { PgService } from 'backend/src/services/pg/pg.service';

@Controller('weapons')
export class WeaponsController {
    constructor(
        private pgService:PgService
    ){}

    @Get(':id')
    public async getWeapon(@Param('id') id:number){
        const Weapon = await this.pgService.getWeapon(id)
        return {Weapon}
    }
}
