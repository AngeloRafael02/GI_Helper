import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Characters } from '../interfaces/characters.interface';

@Injectable({
  providedIn: 'root'
})
export class PgsService {

  constructor(
    private http:HttpClient
  ) { }

  private getDayCharacters(day:string):Observable<Characters[]>{
    return this.http.get<Characters[]>('http://localhost:3000/day/'+day+"/Characters")
  }

  private getACharacter(id:number):Observable<Characters[]>{
    return this.http.get<Characters[]>('http://localhost:3000/character/'+id)
  }
}
