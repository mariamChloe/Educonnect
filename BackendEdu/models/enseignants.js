const mongoose = require('mongoose');
const bcrypt = require("bcrypt")
const db = require('../config/db');

const enseignantSchema = new mongoose.Schema({
  matricule: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  classe: {
    type: String,
    required: true,
  },
  cours: {
    type: String,
    required: true,
  },
  listeEleves: [
    {
      eleve: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Eleve',
      },
      assiduite: {
        type: Boolean,
        default: false,
      },
      commentaire: String,
      note: {
        type: Number,
        default: null, // Vous pouvez ajuster cela en fonction de vos besoins
      },
    },
  ],
});

const Enseignant = mongoose.model('Enseignant', enseignantSchema);
enseignantSchema.pre('save' ,async function(){
  try {
    var Enseigants = this;
    const salt = await (bcrypt.geneSalt(10));
    const hashpass = await bcrypt.hash(Enseigants.password,salt)

  } catch (error) {
    throw error;
  }
})

module.exports = Enseignant;
