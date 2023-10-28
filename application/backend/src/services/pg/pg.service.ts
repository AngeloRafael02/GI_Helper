import { Injectable } from '@nestjs/common';
import { Pool } from 'pg'
import { ConfigService } from '@nestjs/config';

@Injectable()
export class PgService {

  constructor(
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
}
