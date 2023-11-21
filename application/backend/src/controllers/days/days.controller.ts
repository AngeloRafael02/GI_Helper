import { Controller,Get,Param } from '@nestjs/common';
import { PgService } from 'backend/src/services/pg/pg.service';

@Controller('day')
export class DaysController {
    constructor(
        private pgService:PgService
    ){}

    @Get(':day')
    public async getAllDay(@Param('day') day:string ) {
        const charResult = await this.pgService.getDayCharacters(day);
        return {charResult}
    }

}
