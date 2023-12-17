import { TestBed } from '@angular/core/testing';

import { MngsService } from './mngs.service';

describe('MngsService', () => {
  let service: MngsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MngsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
