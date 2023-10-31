import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Elements{
    @PrimaryGeneratedColumn()      
    id:number;
    @Column()
    element:string;
}