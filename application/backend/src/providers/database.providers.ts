import { DataSource } from 'typeorm';
import { Elements } from '../entity/elements.entity';

export const databaseProviders = [
  {
    provide: 'DATA_SOURCE',
    useFactory: async () => {
      const dataSource = new DataSource({
        type: 'postgres',
        host: 'ep-autumn-lab-70106029-pooler.ap-southeast-1.aws.neon.tech',
        port: 5432,
        username: 'recioangelorafael',
        password: '2oyjINbO1RHE',
        database: 'neondb',
        entities: [Elements],
        synchronize: false,
        ssl:true,
        connectTimeoutMS:0,
      });

      return dataSource.initialize();
    },
  },
];