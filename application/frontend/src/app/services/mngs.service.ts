import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Task } from '../interfaces/tasks.interface';

@Injectable({
  providedIn: 'root'
})
export class MngsService {

  constructor(
    private http:HttpClient
  ) { }

  private backendUrl = 'http://localhost:3000';

  private getTasks(day:string):Observable<Task[]>{
    return this.http.get<Task[]>(`${this.backendUrl}/:day/${day}`)
  }

  private createTask(task:Task):Observable<Task>{
    return this.http.post<Task>(`${this.backendUrl}/:day`,task)
  }

  private updateTask(updateData:{task:string, newTask:string}):Observable<Task>{
    return this.http.put<Task>(`${this.backendUrl}/:day`,updateData)
  }

  private deleteTask(deleteData:{task:string}):Observable<void>{
    const option = { body:deleteData.task }
    return this.http.delete<void>(`${this.backendUrl}/:day`,option);
  }
}
