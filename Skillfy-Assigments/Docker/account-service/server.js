const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/health', (req, res) => {
    res.status(200).json({ status: "UP", service: "Account Service" });
});

app.get('/accounts/:id', (req, res) => {
    res.status(200).json({
        accountId: req.params.id,
        status: "ACTIVE",
        balance: 5430.75,
        currency: "USD"
    });
});

app.listen(PORT, () => {
    console.log(`Account Service running on port ${PORT}`);
});