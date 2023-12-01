const mongoose = require('mongoose');

const assiduiteSchema = new mongoose.Schema({
  ideleve: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Eleve',
    required: true,
  },
  dates: {
    type: Date,
    default: Date.now,
  },
  idcours: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Cours',
    required: true,
  },
  presence: {
    type: Boolean,
    required: true,
  },
  commentaire: String,
});

const Assiduite = mongoose.model('Assiduite', assiduiteSchema);

module.exports = Assiduite;
