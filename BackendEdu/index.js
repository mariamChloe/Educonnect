// server.js
const app = require('./app');
const db = require ('./config/db')
const port = 3000;

app.listen(port, () => {
  console.log(`Serveur écoutant sur le port http://localhost:${port}`);
});
