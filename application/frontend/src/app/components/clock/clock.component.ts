import { Component, OnInit  } from '@angular/core';

@Component({
  selector: 'app-clock',
  templateUrl: '../../templates/clock.component.html',
  styleUrls: ['../../styles/clock.component.scss']
})
export class ClockComponent implements OnInit {
  public currentTime: string = '';

  ngOnInit(): void {
    setInterval(() => {
      this.updateTime();
    }, 1000);
  }

  updateTime() {
    const currentDate = new Date();
    let hours = currentDate.getHours();
    const minutes = currentDate.getMinutes();
    const seconds = currentDate.getSeconds();
    const ampm = hours >= 12 ? 'PM' : 'AM';

    hours = hours % 12;
    hours = hours ? hours : 12; // Convert midnight (0 hours) to 12

    const formattedHours = this.padZero(hours);
    const formattedMinutes = this.padZero(minutes);
    const formattedSeconds = this.padZero(seconds);

    this.currentTime = `${formattedHours}:${formattedMinutes}:${formattedSeconds} ${ampm}`;
  }
  
  padZero(value: number): string {
    return value < 10 ? `0${value}` : `${value}`;
  }
}
