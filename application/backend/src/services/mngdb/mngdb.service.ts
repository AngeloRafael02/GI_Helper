import { Injectable } from '@nestjs/common';
import { MongoClient,ServerApiVersion} from 'mongodb';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class MngdbService {

    constructor(
        private readonly config:ConfigService
    ){}

    private client = new MongoClient(this.config.getOrThrow('MONGODB_URL'), {
        serverApi: {
          version: ServerApiVersion.v1,
          strict: true,
          deprecationErrors: true,
        }
    });

    public async getMongoDBVersion(){
        try {
            await this.client.connect();
            await this.client.db('GI_DB').command({ping:1})
            console.log("Pinged your deployment. You successfully connected to MongoDB!");
        } finally {
            await this.client.close();
        }
    }
}
