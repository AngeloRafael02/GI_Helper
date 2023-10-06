import { Test, TestingModule } from '@nestjs/testing';
import { MngdbService } from './mngdb.service';

describe('MngdbService', () => {
  let service: MngdbService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [MngdbService],
    }).compile();

    service = module.get<MngdbService>(MngdbService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
