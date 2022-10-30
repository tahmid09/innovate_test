import {
  IsBoolean,
    IsNotEmpty,
    IsOptional,
    IsString,
  } from 'class-validator';

  export class DeviceDto {
    @IsString()
    @IsNotEmpty()
    deviceId: string;

    @IsString()
    @IsNotEmpty()
    deviceType: string;

    @IsString()
    @IsNotEmpty()
    deviceName: string;

    @IsString()
    @IsNotEmpty()
    groupId: string;

    @IsString()
    @IsNotEmpty()
    dataType: string;

    @IsNotEmpty()
    data: {
      temperature: number;
      humidity: number;
      occupancy: boolean;
    }

  }