/*const env = require('process');
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
*/

const mongoose = require('mongoose');
const { MongoClient } = require('mongodb');

const uri = 'mongodb://localhost:27017/EduconnectDB';

const connection = mongoose.createConnection(uri, { useNewUrlParser: true, useUnifiedTopology: true });

connection.on('open', () => {
  console.log('Connected to MongoDB');
});

connection.on('error', (err) => {
  console.error('MongoDB connection error:', err.message);
});

const eleveSchema = new mongoose.Schema({
  nom: String,
  prenom: String,
});

const Eleve = connection.model('Eleve', eleveSchema);

class DBClient {
  async saveEleves(eleves) {
    try {
      // Supprimez tous les documents existants dans la collection "eleves"
      await Eleve.deleteMany({});

      // Enregistrez les nouveaux élèves dans la base de données
      await Eleve.insertMany(eleves);

      console.log('Liste des élèves enregistrée avec succès dans la base de données MongoDB locale.');
    } catch (error) {
      console.error('Erreur lors de l\'enregistrement de la liste des élèves dans la base de données MongoDB locale:', error);
    }
  }
}

module.exports = new DBClient();

