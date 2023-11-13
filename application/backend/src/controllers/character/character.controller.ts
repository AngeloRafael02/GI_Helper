import { Controller,Get,Param } from '@nestjs/common';
import { PgService } from 'backend/src/services/pg/pg.service';

@Controller('character')
export class CharacterController {

    constructor(
        private pgService:PgService,
    ) {}

    @Get(':id')
    public async getHello(@Param('id') id:number){
      const pgTest = await this.pgService.getCharacter(id)
      return {pgTest}
    }
}
