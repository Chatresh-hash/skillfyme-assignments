const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({
    service: 'Account Service',
    status: 'Running'
  });
});

app.listen(PORT, () => {
  console.log(`Account Service running on port ${PORT}`);
});