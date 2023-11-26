import { Injectable, Inject } from '@nestjs/common';
import { Repository} from 'typeorm';
import { Pool } from 'pg'
import { ConfigService } from '@nestjs/config';
import { Characters } from 'backend/src/entity/character.entity';
import { Weapons } from 'backend/src/entity/weapon.entity';

@Injectable()
export class PgService {

  constructor(
    @Inject('CHARACTER_REPOSITORY')
    private readonly characterRepository:Repository<Characters>,
    @Inject('WEAPON_REPOSITORY')
    private readonly weaponRepository:Repository<Weapons>,
    private readonly config:ConfigService
  ){}

  private readonly pool = new Pool({
    connectionString: this.config.getOrThrow<string>('DATABASE_URL'),
    idleTimeoutMillis: 0,
    connectionTimeoutMillis: 0,
    ssl: {
      require: true,
    },
  })

  public async getPostgresVersion() {
    const client = await this.pool.connect();
    try {
      const response = await client.query('SELECT version()');
      console.log(response.rows[0]);
    } finally {
      client.release();
    }
  }


  public async getAllCharacters():Promise<Characters[]> | undefined {
    const result = await this.characterRepository.find();
    return result;
  }  
  public async getCharacter(index:number):Promise<Characters[]> | undefined {
    const result = await this.characterRepository.find({where:{id:index}});
    return result;
  }
  public async getDayCharacters(day:string):Promise<Characters[]> | undefined {
    const result = await this.characterRepository
      .createQueryBuilder('character')
      .where(`:id = ANY(character.days)`,{id:day.charAt(0).toUpperCase()+day.slice(1)})
      .getMany();
    return result;
  }

  //WEAPON FUNCTIONS
  /**
   * gets all Weapons and their information
   */
  public async getAllWeapons():Promise<Weapons[]>  {
    const result = await this.weaponRepository.find(); 
    return result;
  }
  public async getWeapon(index:number):Promise<Weapons[]> | undefined {
    const result = await this.weaponRepository.find({where:{id:index}});
    return result;
  }
  public async getDayWeapons(day:string):Promise<Weapons[]> | undefined {
    const result = await this.weaponRepository
      .createQueryBuilder('weapon')
      .where(`:id = ANY(weapon.days)`,{id:day.charAt(0).toUpperCase()+day.slice(1)})
      .getMany();
    return result;
  }
}

//Please Clean this code: only have one way/code to connect app to DB 