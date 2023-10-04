import { Component, OnInit  } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import * as AOS from 'aos';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit{
  title = 'application';

  constructor(private modalService: NgbModal) {
  }
  ngOnInit() {
    AOS.init();
  }

  public open(modal: any): void {
    this.modalService.open(modal);
  }

  
}
