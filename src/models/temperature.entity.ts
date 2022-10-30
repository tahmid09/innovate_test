import {
    Column,
    CreateDateColumn,
    Entity,
    ManyToOne,
    PrimaryGeneratedColumn,
  } from 'typeorm';

  import { DeviceEntity } from './device.entity';

  @Entity('temperature')
  export class TemperatureEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    deviceid: number

    @Column()
    temperature: number
    @Column()
    humidity: number

    @Column({default: false})
    occupancy: boolean

    @Column({default: true})
    status: boolean

    @Column({type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;

    // @ManyToOne(() => DeviceEntity, (ueviceentity) => ueviceentity.id)
    // deviceid: DeviceEntity;

  }