import { Injectable, BadRequestException } from '@nestjs/common';
import { DeviceDto } from './dto/device.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { DeviceEntity } from '../models/device.entity';
import { DeleteResult, Repository, UpdateResult } from 'typeorm';
import { TemperatureEntity } from '../models/temperature.entity';

@Injectable()
export class DeviceService {
    constructor( 
        @InjectRepository(DeviceEntity) private readonly deviceentity: Repository<DeviceEntity> ,
        @InjectRepository(TemperatureEntity) private readonly temperature: Repository<TemperatureEntity> 
    ) {}

    s3test(): string {
        return 's3 Innovate Test Okay!';
      }

      async  insertData(dto: DeviceDto) {
        try {
        const getDevice = await this.deviceentity.findBy({ deviceid: dto.deviceId });

        if(getDevice.length == 0) {
            let device = await this.deviceentity.save({
                deviceid:   dto.deviceId,
                devicetype: dto.deviceType,
                devicename: dto.deviceName,
                groupid:    dto.groupId,
                datatype:   dto.dataType
            });
            let temp = await this.temperature.save({
                temperature:   dto.data.temperature ? dto.data.temperature : 0 ,
                humidity:   dto.data.humidity ? dto.data.humidity : 0,
                occupancy:   dto.data.occupancy,
                deviceid: device.id
            })

            return device;
        } else {
            let temp = await this.temperature.save({
                temperature:   dto.data.temperature ? dto.data.temperature : 0 ,
                humidity:   dto.data.humidity ? dto.data.humidity : 0,
                occupancy:   dto.data.occupancy,
                deviceid: getDevice[0].id
            })
            return temp;
        }

       

      } catch (error) {
        if (error.name === 'QueryFailedError') {
          if (/^duplicate key value violates unique constraint/.test(error.message)) {
            throw new BadRequestException(error.detail);
          } else if (/violates foreign key constraint/.test(error.message)) {
            throw new BadRequestException(error.detail);
          } else {
            throw error;
          }
        } else {
          throw error;
        }
      }
    }
}
