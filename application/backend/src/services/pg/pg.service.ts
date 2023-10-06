import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Element } from 'backend/src/models/element.entity';
import { Repository } from 'typeorm';
import { pool } from 'backend/src/pool';

@Injectable()
export class PgService {

    constructor(
        @InjectRepository(Element) private readonly repo:Repository<Element>
    ){}

    public async getElements():Promise<Element[]>{
        return await this.repo.find();
    }

    public async getPostgresVersion() {
        const client = await pool.connect();
        try {
          const response = await client.query('SELECT version()');
          console.log(response.rows[0]);
        } finally {
          client.release();
        }
      }
}
