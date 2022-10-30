import {
    Column,
    CreateDateColumn,
    Entity,
    ManyToOne,
    PrimaryGeneratedColumn,
  } from 'typeorm';

  @Entity('device')
  export class DeviceEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ nullable: true })
    deviceid: string
    @Column({ nullable: true })
    devicetype: string
    @Column({ nullable: true })
    devicename: string
    @Column({ nullable: true })
    groupid: string
    @Column({ nullable: true })
    datatype: string

    @Column({default: true})
    status: boolean

    @Column({type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;

  }