import request from 'supertest';
import app from '../src/app';

describe('GET /api/time', () => {
  it('returns 200 and current time in ISO format', async () => {
    const res = await request(app).get('/api/time');
    expect(res.status).toBe(200);
    expect(res.body).toHaveProperty('time');
    const parsed = new Date(res.body.time);
    expect(parsed.toString()).not.toBe('Invalid Date');
  });
});
