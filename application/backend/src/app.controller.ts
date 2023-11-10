import { Controller, Get} from '@nestjs/common';
import { MngdbService } from './services/mngdb/mngdb.service';

@Controller()
export class AppController {
  constructor(

    private mngdbService:MngdbService
  ) {}

  @Get()
  async getHello(){
    const mgbTest = await this.mngdbService.getMongoDBVersion();
    return {mgbTest}
  }
}