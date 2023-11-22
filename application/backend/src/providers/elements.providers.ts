import { DataSource } from 'typeorm';
import { Characters } from '../entity/character.entity';

export const characterProviders = [{
    provide:'CHARACTER_REPOSITORY',
    useFactory: (datasource:DataSource) => datasource.getRepository(Characters),
    inject:['DATA_SOURCE'],
}];