import { DataSource } from 'typeorm';
import { Characters } from '../entity/character.entity';
import { Weapons } from '../entity/weapon.entity';

export const characterProviders = [{
    provide:'CHARACTER_REPOSITORY',
    useFactory: (datasource:DataSource) => datasource.getRepository(Characters),
    inject:['DATA_SOURCE'],
}];

export const weaponsProviders = [{
    provide:'WEAPON_REPOSITORY',
    useFactory: (datasource:DataSource) => datasource.getRepository(Weapons),
    inject:['DATA_SOURCE'],
}]