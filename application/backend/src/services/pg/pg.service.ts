import { Injectable, Inject } from '@nestjs/common';
import { Repository } from 'typeorm';
import { Elements } from 'backend/src/entity/elements.entity';
import { Pool } from 'pg'
import { ConfigService } from '@nestjs/config';
import { Characters } from 'backend/src/entity/character.entity';

@Injectable()
export class PgService {

  constructor(
    @Inject('ELEMENT_REPOSITORY')
    private readonly elementReposity:Repository<Elements>,
    @Inject('CHARACTER_REPOSITORY')
    private readonly characterRepository:Repository<Characters>,
    private readonly config:ConfigService
  ){}

  private readonly pool = new Pool({
    connectionString: this.config.get<string>('DATABASE_URL'),
    idleTimeoutMillis: 0,
    connectionTimeoutMillis: 0,
    ssl: {
      require: true,
    },
  })
  private connection = this.pool.connect();

  public async getPostgresVersion() {
    const client = await this.connection
    try {
      const response = await client.query('SELECT version()');
      console.log(response.rows[0]);
    } finally {
      client.release();
    }
  }

  public async GetTestData() {
    const client = await this.connection
    try {
      const response = await client.query(`SELECT * FROM allcharacters;`);
      console.log(response.rows);
      return response.rows;
    } finally {
      client.release();
    }
  }

  public async getElements2():Promise<Elements[] | undefined>{
    const result = await this.elementReposity.find();
    return result;
  }

  public async getAllCharacters():Promise<Characters[]> | undefined {
    const result = await this.characterRepository.find();
    return result;
  }  
}
