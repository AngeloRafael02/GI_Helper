import { Controller, Get, Redirect} from '@nestjs/common';


function getToday():string{
    const daysOfWeek = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
    const currentDate = new Date();
    const currentDayIndex = currentDate.getDay(); // 0 for Sunday, 1 for Monday, ...

    return '/day/'+daysOfWeek[currentDayIndex];
} 

@Controller()
export class AppController {
  constructor(
  ) {}

  @Get()
  @Redirect(getToday(),301)
  async getHello(){
    console.log("What?")
  }
}