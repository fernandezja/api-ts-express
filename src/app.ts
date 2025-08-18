import express from 'express';

const app = express();

app.get('/api/time', (_req, res) => {
  res.json({ time: new Date().toISOString() });
});

export default app;
