const express = require('express');
const app = express();
const port = 3000;

app.get('/', (_req, res) => {
  res.send('Hello from Express frontend!');
});

app.listen(port, () => {
  console.log(`Express app running at http://localhost:${port}`);
});
