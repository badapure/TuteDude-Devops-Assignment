const express = require("express");
const axios = require("axios");

const app = express();
const PORT = 3000;
const BACKEND_URL = process.env.BACKEND_URL || "http://localhost:5000";

app.get("/", async (req, res) => {
  try {
    const response = await axios.get(`${BACKEND_URL}/`);
    res.send(`
      <h1>Frontend (Express)</h1>
      <p>Backend says: ${response.data.message}</p>
    `);
  } catch (err) {
    console.error(err.message);
    res.send("Error communicating with backend");
  }
});

app.listen(PORT, () => {
  console.log(`Frontend running on http://localhost:${PORT}`);
});
