const mongoose = require('mongoose');

const eleveSchema = new mongoose.Schema({
  nom: String,
  prenom: String,
  matricule: String,
  sexe: String,
  present: { type: Boolean, default: false }
});

const listeClasseSchema = new mongoose.Schema({
  nomClasse: String,
  eleves: [eleveSchema]
});

const ListeClasse = mongoose.model('ListeClasse', listeClasseSchema);

module.exports = ListeClasse;
