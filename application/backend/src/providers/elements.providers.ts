import { DataSource } from 'typeorm';
import { Elements } from '../entity/elements.entity';

export const elementProviders = [{
    provide:'ELEMENT_REPOSITORY',
    useFactory: (dataSource: DataSource) => dataSource.getRepository(Elements),
    inject:['DATA_SOURCE'], 
}] 