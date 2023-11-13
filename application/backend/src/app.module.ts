import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { ElementsController } from './controllers/elements/elements.controller';

import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { PgService } from './services/pg/pg.service';
import { MngdbService } from './services/mngdb/mngdb.service';
import { DatabaseModule } from './module/database.module';
import { elementProviders,characterProviders } from './providers/elements.providers';
import { CharacterController } from './controllers/character/character.controller';
import { DaysController } from './controllers/days/days.controller';
import { WeaponsController } from './controllers/weapons/weapons.controller';


@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, // Makes the configuration module global
      envFilePath: ['.env.development', '.env'], // Specify the files to load environment variables from
    
    }),
    DatabaseModule
  ],
  controllers: [
    AppController,
    ElementsController,
    CharacterController,
    DaysController,
    WeaponsController
  ],
  providers: [
    ...elementProviders,
    ...characterProviders,
    AppService,
    PgService,
    MngdbService
  ],
})
export class AppModule {}
