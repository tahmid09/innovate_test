import { Body, Controller, Post, Get  } from '@nestjs/common';
import { DeviceService } from './device.service';
import { DeviceDto } from './dto/device.dto';

@Controller('api')
export class DeviceController {
    constructor(private device: DeviceService) {}

    @Get('test-api')
    getTest(): string {
       return this.device.s3test();
    }

    @Post('insert-information')
    insertDate(@Body() dto: DeviceDto) {
      return this.device.insertData(dto);
    }
    
}
