const Note = require('../models/Note');

// Fonction pour noter un élève
exports.noterEleve = async (req, res) => {
  try {
    const { idcours, ideleves, valeurNote, commentaireNote, idEnseignant } = req.body;

    // Créer une nouvelle note
    const nouvelleNote = new Note({
      idcours,
      ideleves,
      valeurNote,
      commentaireNote,
      idEnseignant,
    });

    // Sauvegarder la note dans la base de données
    const noteEnregistree = await nouvelleNote.save();

    res.status(201).json(noteEnregistree);
  } catch (error) {
    console.error('Erreur lors de l\'enregistrement de la note :', error);
    res.status(500).json({ message: 'Erreur serveur lors de la création de la note' });
  }
};
