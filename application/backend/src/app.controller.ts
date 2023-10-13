import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { PgService } from './services/pg/pg.service';
import { MngdbService } from './services/mngdb/mngdb.service';

@Controller()
export class AppController {
  constructor(
    private appService: AppService,
    private pgService:PgService,
    private mngdbService:MngdbService
  ) {}

  @Get()
  async getHello(){
    const mgbTest = await this.mngdbService.getMongoDBVersion();
    const pgTest = await this.pgService.getPostgresVersion();
    return {mgbTest,pgTest}
  }
}