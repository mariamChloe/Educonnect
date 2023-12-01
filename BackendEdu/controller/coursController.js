const Cours = require('../models/cours');
const enseignants = require('../models/enseignants');
const ClasseNiveau = require('../models/niveau');
const Eleves = require('../models/Eleves');

// Fonction pour affecter un cours à un enseignant et à un élève en fonction du matricule et du niveau d'étude
exports.affecterCours = async (req, res) => {
  try {
    const { matriculeEleve, niveauEtude } = req.body;

    // Trouver l'enseignant par son ID (à partir du modèle Enseignant)
    const enseignant = await enseignants.findById(req.params.idEnseignant);
    if (!enseignant) {
      return res.status(404).json({ message: "Enseignant non trouvé" });
    }

    // Trouver la classe/niveau par son ID (à partir du modèle ClasseNiveau)
    const classeNiveau = await ClasseNiveau.findById(req.params.idClasseNiveau);
    if (!classeNiveau) {
      return res.status(404).json({ message: "Classe/Niveau non trouvé" });
    }

    // Trouver l'élève par son matricule et niveau d'étude (à partir du modèle Eleve)
    const eleve = await Eleve.findOne({ matricule: matriculeEleve, niveauEtude });
    if (!eleve) {
      return res.status(404).json({ message: "Élève non trouvé" });
    }

    // Créer un nouveau cours en utilisant le modèle Cours
    const nouveauCours = new Cours({
      nomCours: req.body.nomCours,
      idEnseignant: enseignant._id,
      idClasseNiveau: classeNiveau._id,
    });

    // Sauvegarder le cours
    await nouveauCours.save();

    // Affecter le cours à l'élève
    eleve.cours.push(nouveauCours._id);
    await eleve.save();

    return res.status(201).json({ message: "Cours affecté avec succès" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Erreur serveur" });
  }
};
