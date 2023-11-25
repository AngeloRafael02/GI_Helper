import { Entity,Column, PrimaryGeneratedColumn } from "typeorm";

@Entity('allWeapons')
export class Weapons {
    
    @PrimaryGeneratedColumn()      
    id:number;

    @Column()
    name:string;

    @Column()
    star:number;

    @Column()
    type:string;

    @Column()
    stat:string;

    @Column()
    domainname:string;

    @Column("text", { array: true })
    weaponmats: string[];

    @Column("text", { array: true })
    enhancemats1: string[];

    @Column("text", { array: true })
    enhancemats2: string[];

    @Column("text", { array: true })
    days: string[];
    
    @Column()
    imgurl:string;
}