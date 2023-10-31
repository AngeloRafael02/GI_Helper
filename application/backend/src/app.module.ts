import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { PgService } from './services/pg/pg.service';
import { MngdbService } from './services/mngdb/mngdb.service';
import { DatabaseModule } from './module/database.module';
import { elementProviders } from './providers/elements.providers';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, // Makes the configuration module global
      envFilePath: ['.env.development', '.env'], // Specify the files to load environment variables from
    
    }),
    DatabaseModule
  ],
  controllers: [AppController],
  providers: [
    ...elementProviders,
    AppService,
    PgService,
    MngdbService
  ],
})
export class AppModule {}
