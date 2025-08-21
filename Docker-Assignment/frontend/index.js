const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');

const app = express();
const PORT = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/form.html');
});

app.post('/submit', async (req, res) => {
    try {
        const response = await axios.post('http://backend:5000/submit', req.body);
        res.send(`<h2>Backend Response: ${response.data.message}</h2>`);
    } catch (err) {
        console.error(err);
        res.status(500).send("Error communicating with backend");
    }
});

app.listen(PORT, () => {
    console.log(`Frontend server running on http://localhost:${PORT}`);
});
