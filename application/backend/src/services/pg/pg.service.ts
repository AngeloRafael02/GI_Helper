import { Injectable, Inject } from '@nestjs/common';
import { Repository } from 'typeorm';
import { Elements } from 'backend/src/entity/elements.entity';
import { Pool } from 'pg'
import { ConfigService } from '@nestjs/config';

@Injectable()
export class PgService {

  constructor(
    @Inject('ELEMENT_REPOSITORY')
    private elementReposity:Repository<Elements>,
    private readonly config:ConfigService
  ){}

  private readonly pool = new Pool({
    connectionString: this.config.get<string>('DATABASE_URL'),
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

  public async getElements() {
    const client = await this.connection
    try {
      const response = await client.query('SELECT * FROM elements;');
      console.log(response.rows);
    } finally {
      client.release();
    }
  }

  public async getElements2():Promise<Elements[]>{
    const result = await this.elementReposity.find();
    return result;
  }
}
