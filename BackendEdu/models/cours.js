const mongoose = require('mongoose');

const coursSchema = new mongoose.Schema({
  nomCours: {
    type: String,
    required: true,
  },
  idEnseignant: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Enseignant',
    required: true,
  },
  idClasseNiveau: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'ClasseNiveau',
    required: true,
  },
});

const Cours = mongoose.model('Cours', coursSchema);

module.exports = Cours;
