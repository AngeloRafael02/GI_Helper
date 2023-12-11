import { Component, OnInit  } from '@angular/core';

@Component({
  selector: 'app-timer',
  templateUrl: '../../templates/timer.component.html',
  styleUrls: ['../../styles/timer.component.scss']
})
export class TimerComponent implements OnInit{
  public remainingTime: string = '';

  ngOnInit() {
    this.startTimer();
  }

  private startTimer() {
    const targetTime = this.get4AMTargetTime();
    this.updateTime(targetTime);

    setInterval(() => {
      const currentTime = new Date();
      if (currentTime >= targetTime) {
        targetTime.setDate(targetTime.getDate() + 1);
        this.updateTime(targetTime); 
      }
      this.updateTime(targetTime);
    }, 1000);
  }

  private get4AMTargetTime(): Date {
    const targetTime = new Date();
    targetTime.setHours(4, 0, 0, 0);
    if (targetTime <= new Date()) {
      targetTime.setDate(targetTime.getDate() + 1);
    }
    return targetTime;
  }

  private updateTime(targetTime: Date) {
    const currentTime = new Date();
    const timeDiff = targetTime.getTime() - currentTime.getTime();

    const hours = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);

    this.remainingTime = `${this.formatTime(hours)}:${this.formatTime(minutes)}:${this.formatTime(seconds)}`;
  }

  private formatTime(time: number): string {
    return time < 10 ? `0${time}` : `${time}`;
  }
}
