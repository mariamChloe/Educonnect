const mongoose = require('mongoose');

const noteSchema = new mongoose.Schema({
  idcours: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Cours',
    required: true,
  },
  ideleves: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Eleve',
    required: true,
  },
  dates: {
    type: Date,
    default: Date.now,
  },
  valeurNote: {
    type: Number,
    required: true,
  },
  commentaireNote: String,
  idEnseignant: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Enseignant',
    required: true,
  },
});

const Note = mongoose.model('Note', noteSchema);

module.exports = Note;
