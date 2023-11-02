import { Controller,Get } from '@nestjs/common';
import { PgService } from 'backend/src/services/pg/pg.service';

@Controller('elements')
export class ElementsController {
    constructor(
        private pgService:PgService
    ){}
    
    @Get()
    async elements(){
        return await this.pgService.getElements2();
    }
}