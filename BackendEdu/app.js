const express = require('express');
const mongoose = require('mongoose');
const Enseignants = require('./models/enseignants');
const eleve = require('./models/élèves');
const listeClasse = require('./models/listeClasse');
const note = require('./models/note');

//const {noteController} = require('./controller/noteController');
//const { marquerAssiduite, enregistrerNotes } = require('./controller/elevesController');


const cors = require('cors');

const app = express();
const port = process.env.PORT || 3000;

// Configurations et middlewares...
const mongoURI = 'mongodb://localhost:27017/EduconnectDB';

mongoose.connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true });

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'Erreur de connexion MongoDB :'));
db.once('open', () => {
  console.log('Connecté à MongoDB');
});

app.use(express.json());
app.use(cors());

app.get('/enseignants', async (req, res) => {
  try {
    const enseignants = await Enseignants.find();
    console.log('Liste des enseignants récupérée avec succès');
    res.json(enseignants);
  } catch (error) {
    console.error('Erreur de la récupération des enseignants:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.post('/authenticate', async (req, res) => {
  const { matricule, password } = req.body;

  if (!matricule || !password) {
    return res.status(400).json({ error: 'Matricule and password are required.' });
  }

  try {
    const enseignant = await Enseignants.findOne({ matricule });

    if (!enseignant) {
      return res.status(401).json({ error: 'Échec de l\'authentification. Matricule introuvable.' });
    }

    if (password === enseignant.password) {
      res.status(200).json({ message: 'Authentification réussie', data: enseignant });
    } else {
      res.status(401).json({ error: 'Échec de l\'authentification. Mot de passe incorrect.' });
    }
  } catch (error) {
    console.error('Erreur d\'authentification:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Route pour afficher la liste des eleves de la classe


// Route pour afficher la liste des classes
app.get('/listeClasses', async (req, res) => {
  try {
    const classes = await listeClasse.find(); // Utilisez une variable différente ici
    res.json(classes);
  } catch (error) {
    console.error('Error retrieving classes:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});




// ...

app.get('/listeClasse/:nomClasse', async (req, res) => {
  try {
    const nomClasse = req.params.nomClasse;
    const classe = await listeClasse.findOne({ nomClasse }); // Utilisez une variable différente ici

    if (!classe) {
      return res.status(404).json({ error: 'Classe non trouvée' });
    }

    const eleves = classe.eleves.map(eleve => ({
      id: eleve.id,
      nom: eleve.nom,
      prenom: eleve.prenom,
      matricule: eleve.matricule,
      sexe: eleve.sexe,
      nomClasse: eleve.nomClasse,
    }));

    res.json(eleves);
  } catch (error) {
    console.error('Erreur lors de la récupération de la liste de classe :', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

//app.post('/noterEleve', notesController.noterEleve);


app.listen(port, () => {
  console.log(`Le serveur est en cours d'exécution sur le port ${port}`);
});
