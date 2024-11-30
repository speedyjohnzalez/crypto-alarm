require('dotenv').config();
const express = require('express');
const axios = require('axios');
const app = express();
const cors = require('cors');
app.use(cors());
const port = process.env.PORT || 1000;

// Example API URL (for CoinGecko)
const cryptoAPIUrl = 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd';

app.get('/crypto', async (req, res) => {
  try {
    const response = await axios.get(cryptoAPIUrl);
    res.json(response.data);
  } catch (error) {
    res.status(500).json({ error: 'Error fetching data from the API' });
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
