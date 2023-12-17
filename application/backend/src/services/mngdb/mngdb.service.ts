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
            const cursor =  collection.find().toArray()
            if ((await collection.countDocuments()) === 0) {
                console.warn("No documents found!");    
              }
            return cursor;
        }catch(err){
            console.log(err);
            return err;
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

    public async putTask(updateData:{task:string, newTask:string}){
        try {
            await this.connect();

            const db = this.client.db(this.config.getOrThrow<string>('MONGO_DB'));
            const collection = db.collection<Task>(this.config.getOrThrow<string>('MONGO_COL'));

            const result = await collection.updateOne({ task:updateData.task}, { $set: { task:updateData.newTask }});

            if (result.modifiedCount === 1) {
                console.log('Document updated successfully');
            } else {
                console.log('Document not found or not updated');
            }
            return { result }
        } catch (err) {
            console.log(err);
            return err;
        }
    }

    public async deleteTask(task:string) {
        try {
            await this.connect();
            const db = this.client.db( this.config.getOrThrow<string>('MONGO_DB') );
            const collection = db.collection<Task>( this.config.getOrThrow<string>('MONGO_COL') );
            
            const result = await collection.deleteOne({task:task })

            if (result.deletedCount === 1) {
                console.log('Document deleted successfully');
            } else {
                console.log('Document not found or not deleted');
            }
            return { result }
        } catch (err) {
            console.log(err);
            return err;
        }
    }
}
