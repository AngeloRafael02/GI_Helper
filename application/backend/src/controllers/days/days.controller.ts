import { Controller,Get,Param } from '@nestjs/common';
import { PgService } from 'backend/src/services/pg/pg.service';

@Controller('day')
export class DaysController {
    constructor(
        private readonly pgService:PgService
    ){}

    @Get(':id')
    public async getAllDay(@Param('id') day:string ) {
        const charResult = await this.pgService.getDayCharacters(day);
        
        return {charResult}
    }

}
