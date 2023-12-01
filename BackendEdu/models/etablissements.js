const mongoose = require('mongoose');

const etablissementsSchema = new mongoose.Schema({
  email: {
    type: String,
    required: true,
    unique: true,
  },
  passwordUser: {
    type: String,
    required: true,
  },
  firstName: {
    type: String,
    required: true,
  },
  lastName: {
    type: String,
    required: true,
  },
  etablissementsName: {
    type: String,
    required: true,
  },
  phoneNumber: {
    type: String,
    required: true,
  },
  country: {
    type: String,
    required: true,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
  enseignants: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Enseignant',
    },
  ],
});

etablissementsSchema.methods.addEnseignant = function (enseignantId) {
  this.enseignants.push(enseignantId);
  return this.save();
};

etablissementsSchema.methods.removeEnseignant = function (enseignantId) {
  this.enseignants = this.enseignants.filter(id => id !== enseignantId);
  return this.save();
};

etablissementsSchema.methods.assignClassToEnseignant = function (enseignantId, className) {
  const enseignant = this.enseignants.find(id => id === enseignantId);
  if (enseignant) {
    // Logique pour affecter une classe à un enseignant
  }
  return this.save();
};

etablissementsSchema.methods.listClassesForEnseignant = function (enseignantId) {
  const enseignant = this.enseignants.find(id => id === enseignantId);
  if (enseignant) {
    // Logique pour lister les classes de l'enseignant
    // Retourner la liste des classes
  }
};

const Etablissements = mongoose.model('Etablissements', etablissementsSchema);

module.exports = Etablissements;
