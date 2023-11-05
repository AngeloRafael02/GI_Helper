import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('allcharacters')
export class Characters{
    @PrimaryGeneratedColumn()      
    id:number;

    @Column()
    name:string;

    @Column()
    star:number;

    @Column()
    element:string;

    @Column()
    type:string;

    @Column()
    region:string;

    @Column()
    domainname:string;

    @Column("text", { array: true })
    skillmats: string[];

    @Column("text", { array: true })
    enhancemats: string[];

    @Column("text", { array: true })
    gemmats: string[];

    @Column()
    bossmats:string;

    @Column()
    trouncemats:string;

    @Column()
    localspecialty:string;

    @Column("text", { array: true })
    days: string[];
    
    @Column()
    imgurl:string;}