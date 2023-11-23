import { DataSource } from 'typeorm';
import { Characters } from '../entity/character.entity';
require('dotenv').config();

export const databaseProviders = [
  {
    provide: 'DATA_SOURCE',
    useFactory: async () => {
      const dataSource = new DataSource({
        type: 'postgres',
        host: process.env['PG_HOST'],
        port: 5432,
        username: process.env['PG_USERNAME'],
        password: process.env['PG_PASSWORD'],
        database: process.env['PG_DB'],
        entities: [Characters],
        synchronize: false,
        ssl:true,
        connectTimeoutMS:0,
      });

      return dataSource.initialize();
    },
  },
];