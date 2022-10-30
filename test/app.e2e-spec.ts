import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication, ValidationPipe } from '@nestjs/common';
import * as request from 'supertest';
import { AppModule } from './../src/app.module';
import * as pactum from 'pactum';
import { DeviceDto } from 'src/device/dto';


describe('App e2e', () => {
  let app: INestApplication;

  beforeAll(async () => {
    const moduleRef =
      await Test.createTestingModule({
        imports: [AppModule],
      }).compile();

    app = moduleRef.createNestApplication();
    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
      }),
    );
    await app.init();
    await app.listen(3003);
 
  });

  afterAll(() => {
    app.close();
  });



  describe('Create Device', () => {
    const dto: DeviceDto = {
      deviceId: "ibm-878A661",
      deviceType: "computer1.0.0",
      deviceName: "VN1-1-3",
      groupId: "847b3b2f1b05dc4",
      dataType: "DATA",
      data: {
        temperature: 21,
        humidity: 53,
        occupancy: true
      }
    };
    it('should create Device', () => {
      return pactum
        .spec()
        .post('http://localhost:3003/api/insert-information')
        .withBody(dto)
        .expectStatus(201)
        .stores('deviceid', 'id');
    });
  });

});
