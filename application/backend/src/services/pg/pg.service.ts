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

  public async getPostgresVersion() {
    const client = await this.pool.connect();
    try {
      const response = await client.query('SELECT version()');
      console.log(response.rows[0]);
    } finally {
      client.release();
    }
  }
}
