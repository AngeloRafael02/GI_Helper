import { Injectable } from '@nestjs/common';
import { MongoClient,ServerApiVersion} from 'mongodb';
import { ConfigService } from '@nestjs/config';
import { Task } from 'backend/src/entity/task.interface';

@Injectable()
export class MngdbService {

    constructor(
        private readonly config:ConfigService
    ){}

    private client = new MongoClient(this.config.getOrThrow<string>('MONGODB_URL'), {
        serverApi: {
          version: ServerApiVersion.v1,
          strict: true,
          deprecationErrors: true,
        }
    });
    private async connect() { await this.client.connect(); }
    private async close() { await this.client.close();  }

    public async getMongoDBVersion(){
        try {
            await this.connect();
            await this.client.db('GI_DB').command({ping:1})
            console.log("Pinged your deployment. You successfully connected to MongoDB!");
        } finally {
            await this.close()
        }
    }

    
    public async getTasks() {
        try{
            await this.connect();
            const db = this.client.db( this.config.getOrThrow<string>('MONGO_DB') );
            const collection = db.collection( this.config.getOrThrow<string>('MONGO_COL') );
            collection.find().toArray().then(function (results) {
                console.log(results);
                return results;
            });
        }catch(err){
            console.log(err);
        }
    }

    public async postTask(task:string){
        try {
            await this.connect();
            const db = this.client.db( this.config.getOrThrow<string>('MONGO_DB') );
            const collection = db.collection<Task>( this.config.getOrThrow<string>('MONGO_COL') );
        await collection.insertOne({
                task:task,
                dateCreated: new Date()
            }).then(function (res) {
                console.log(`A document was inserted: ${res.acknowledged}`);
            })
        }catch(err){
            console.log(err);
        }
    }
}
