import { DataSource } from 'typeorm';
import { Elements } from '../entity/elements.entity';
import { Characters } from '../entity/character.entity';

export const elementProviders = [{
    provide:'ELEMENT_REPOSITORY',
    useFactory: (dataSource: DataSource) => dataSource.getRepository(Elements),
    inject:['DATA_SOURCE'], 
}];

export const characterProviders = [{
    provide:'CHARACTER_REPOSITORY',
    useFactory: (datasource:DataSource) => datasource.getRepository(Characters),
    inject:['DATA_SOURCE'],
}];