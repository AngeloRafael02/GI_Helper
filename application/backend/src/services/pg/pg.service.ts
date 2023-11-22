import { Injectable, Inject } from '@nestjs/common';
import { Repository} from 'typeorm';
import { Pool } from 'pg'
import { ConfigService } from '@nestjs/config';
import { Characters } from 'backend/src/entity/character.entity';

@Injectable()
export class PgService {

  constructor(
    @Inject('CHARACTER_REPOSITORY')
    private readonly characterRepository:Repository<Characters>,
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
    let query = day
    const result = await this.characterRepository
      .createQueryBuilder('character')
      .where(`:id = ANY(character.days)`,{id:query.charAt(0).toUpperCase()+query.slice(1)})
      .getMany();
    return result;
  }
}

//Please Clean this code: only have one way/code to connect app to DB 