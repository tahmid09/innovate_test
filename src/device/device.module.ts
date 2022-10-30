import { Module } from '@nestjs/common';
import { DeviceController } from './device.controller';
import { DeviceService } from './device.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DeviceEntity } from '../models/device.entity';
import { TemperatureEntity } from '../models/temperature.entity';

@Module({
  imports: [TypeOrmModule.forFeature([DeviceEntity, TemperatureEntity])],
  controllers: [DeviceController],
  providers: [DeviceService]
})
export class DeviceModule {}
