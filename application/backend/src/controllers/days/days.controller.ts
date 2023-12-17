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

   
    @Get(':day/characters')
    public async getAllCharacters(@Param('day') day:string){
        const currentCharacters = await this.pgService.getDayCharacters(day);
        return {currentCharacters}
    }

    @Get(':day/weapons')
    public async getAllWeapons(@Param('day') day:string){
        const currentWeapons = await this.pgService.getDayWeapons(day);
        return {currentWeapons}
    }
   
    @Get(':day')
    public async getAllTasks(@Param('day') day:string ) {
    const mgbTest = await this.mngdbService.getTasks();
        return {mgbTest}
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
