import { Controller,Get,Post,Param,Body, Put, Delete } from '@nestjs/common';
import { PgService } from 'backend/src/services/pg/pg.service';
import { MngdbService } from 'backend/src/services/mngdb/mngdb.service';
import { Task } from 'backend/src/entity/task.interface';

@Controller('day')
export class DaysController {
    constructor(
        private pgService:PgService,
        private mngdbService:MngdbService
    ){}

    @Get(':day')
    public async getAllDay(@Param('day') day:string ) {
        const currentCharacters = await this.pgService.getDayCharacters(day);
        const currentWeapons = await this.pgService.getDayWeapons(day);
        const mgbTest = await this.mngdbService.getTasks();
        return {mgbTest,currentCharacters,currentWeapons}
    }

    @Post(':day')
    public async postATask(@Body() body:Task){
        const taskResult = await this.mngdbService.postTask(body.task);
        return {taskResult}
    }

    @Put(':day')
    public async putATask(@Body() updateData:{task:string, newTask:string}) {
        const putResult = await this.mngdbService.putTask(updateData);
        return {putResult}
    }

    @Delete(':day')
    public async deleteATask(@Body() deleteData:{task:string}) {
        const deleteResult = await this.mngdbService.deleteTask(deleteData.task);
        return {deleteResult}
    }

}
