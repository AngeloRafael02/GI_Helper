import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
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
    DomainName:string;

    @Column("text", { array: true })
    SkillMats: string[];

    @Column("text", { array: true })
    EnhanceMats: string[];

    @Column("text", { array: true })
    GemMats: string[];

    @Column()
    BossMats:string;

    @Column()
    TrounceMats:string;

    @Column()
    LocalSpecialty:string;

    @Column("text", { array: true })
    days: string[];
    
    @Column()
    ImgURL:string;}