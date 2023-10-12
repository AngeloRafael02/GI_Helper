import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { PgService } from './services/pg/pg.service';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, // Makes the configuration module global
      envFilePath: ['.env.development', '.env'], // Specify the files to load environment variables from
    
    }),
  ],
  controllers: [AppController],
  providers: [AppService,PgService],
})
export class AppModule {}
