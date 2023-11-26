import { Controller,Get,Param } from '@nestjs/common';
import { PgService } from 'backend/src/services/pg/pg.service';

@Controller('character')
export class CharacterController {

    constructor(
        private pgService:PgService,
    ) {}

    @Get(':id')
    public async getCharacter(@Param('id') id:number){
      const Character = await this.pgService.getCharacter(id)
      return {Character}
    }
}
