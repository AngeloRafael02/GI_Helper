import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { PgService } from './services/pg/pg.service';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private readonly pgService:PgService
  ) {}

  @Get()
  getHello(){
    return this.pgService.getPostgresVersion();
  }
}