import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Characters } from '../interfaces/characters.interface';
import { Weapons } from '../interfaces/weapons.interface';

@Injectable({
  providedIn: 'root'
})
export class PgsService {

  constructor(
    private http:HttpClient
  ) { }

  private backendUrl = 'http://localhost:3000';

  private getDayCharacters(day:string):Observable<Characters[]>{
    return this.http.get<Characters[]>(`${this.backendUrl}/day/${day}/Characters`)
  }

  private getACharacter(id:number):Observable<Characters[]>{
    return this.http.get<Characters[]>(`${this.backendUrl}/character/'${id}`)
  }

  private getDayWeapons(day:string):Observable<Weapons[]>{
    return this.http.get<Weapons[]>(`${this.backendUrl}/day/${day}/Weapons`)
  }

  private getAWeapon(id:number):Observable<Weapons[]>{
    return this.http.get<Weapons[]>(`${this.backendUrl}/weapons/'${id}`)
  }
}
