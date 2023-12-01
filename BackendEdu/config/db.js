const env = require('process');
const mongoose = require('mongoose');
const { MongoClient } = require('mongodb');
const { ServerApiVersion } = require('mongodb');

const uri = 'mongodb://localhost:27017/EduconnectDB';

const connection = mongoose.createConnection(uri, { useNewUrlParser: true, useUnifiedTopology: true });

connection.on('open', () => {
  console.log('Connected to MongoDB');
});

connection.on('error', (err) => {
  console.error('MongoDB connection error:', err.message);
});

class DBClient {
  // ... rest of the class remains unchanged
}

module.exports = new DBClient();
