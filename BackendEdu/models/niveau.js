const mongoose = require('mongoose');

const niveauSchema = new mongoose.Schema({
  nomNiveau: {
    type: String,
    required: true,
  },
  anneeScolaire: {
    type: String,
    required: true,
  },
  idEnseignant: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Enseignant',
    required: true,
  },
});

const Niveau = mongoose.model('Niveau', niveauSchema);

module.exports = Niveau;
