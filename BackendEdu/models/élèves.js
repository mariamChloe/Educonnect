const mongoose = require('mongoose');

const eleveSchema = new mongoose.Schema({
  id: {
    type: String,
    required: true,
    unique: true,
  },
  matricule: {
    type: String,
    required: true,
    unique: true,
  },
  nom: {
    type: String,
    required: true,
  },
  prenom: {
    type: String,
    required: true,
  },
  idParents: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Parents',
  },
  dateDeNaissance: {
    type: Date,
    required: true,
  },
  classe: {
    type: String,
    required: true,
  },
});

const elevesAajouter = [
  {
    id: '1',
    matricule: 'M1001',
    nom: 'Traore',
    prenom: 'Mariam',
    idParents: '6038f73b9d201c2a2c67e4a1', // L'ID du parent associé
    dateDeNaissance: new Date('2000-01-01'),
    classe: 'TerminaleA',
  },
  {
    id: '2',
    matricule: 'M1002',
    nom: 'Laya',
    prenom: 'poudiougo',
    idParents: '6038f73b9d201c2a2c67e4a2', // L'ID du parent associé
    dateDeNaissance: new Date('2000-01-02'),
    classe: 'TerminaleA',
  },
  {
    id: '3',
    matricule: 'M1003',
    nom: 'Racine',
    prenom: 'Yao',
    idParents: '6038f73b9d201c2a2c67e4a2', // L'ID du parent associé
    dateDeNaissance: new Date('2000-01-02'),
    classe: 'TerminaleA',
  },
  {
    id: '4',
    matricule: 'M1004',
    nom: 'Grace',
    prenom: 'Gnapa',
    idParents: '6038f73b9d201c2a2c67e4a2', // L'ID du parent associé
    dateDeNaissance: new Date('2000-01-02'),
    classe: 'TerminaleA',
  },
  {
    id: '5',
    matricule: 'M1005',
    nom: 'Marie',
    prenom: 'Joseph',
    idParents: '6038f73b9d201c2a2c67e4a2', // L'ID du parent associé
    dateDeNaissance: new Date('2000-01-02'),
    classe: 'TerminaleA',
  },
  // ... Ajoutez d'autres élèves ici
];

// Ajouter les élèves à la base de données
const Eleve = mongoose.model('Eleve', eleveSchema);

Eleve.insertMany(elevesAajouter)
  .then((result) => {
    console.log(`${result.length} élèves ajoutés avec succès.`);
    // Faites quelque chose après l'ajout des élèves si nécessaire
  })
  .catch((error) => {
    console.error('Erreur lors de l\'ajout des élèves :', error);
  });


module.exports = Eleve;
