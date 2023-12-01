/*const express = require('express');
const router = express.Router();
const ListeClasse = require('../models/listeClasse');

// Endpoint pour récupérer la liste de classe
router.get('/listeClasse/:nomClasse', async (req, res) => {
  try {
    const nomClasse = req.params.nomClasse;
    const listeClasse = await ListeClasse.findOne({ nomClasse });
    console.log('listeClasse')
    res.json(listeClasse);
  } catch (error) {
    console.error('Erreur lors de la récupération de la liste de classe :', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Endpoint pour marquer la présence d'un élève
router.put('/listeClasse/:nomClasse/marquerPresence/:matricule', async (req, res) => {
  try {
    const nomClasse = req.params.nomClasse;
    const matricule = req.params.matricule;

    const listeClasse = await ListeClasse.findOne({ nomClasse });

    if (!listeClasse) {
      return res.status(404).json({ error: 'Classe non trouvée' });
    }

    const eleve = listeClasse.eleves.find(e => e.matricule === matricule);

    if (!eleve) {
      return res.status(404).json({ error: 'Élève non trouvé dans la classe' });
    }

    // Marquer la présence
    eleve.present = !eleve.present;

    // Enregistrer les modifications
    await listeClasse.save();

    res.json({ message: 'Présence marquée avec succès' });
  } catch (error) {
    console.error('Erreur lors de la mise à jour de la présence :', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

module.exports = router;
*/
const express = require('express');
const router = express.Router();
const ListeClasse = require('../models/listeClasse');

// Endpoint pour récupérer la liste des classes par nom et prénom
router.get('/listeClasses/:nom/:prenom', async (req, res) => {
  try {
    const nom = req.params.nom;
    const prenom = req.params.prenom;

    // Utilisez findOne pour trouver une classe spécifique par nom et prénom de l'élève
    const listeClasse = await ListeClasse.findOne({ "eleves.nom": nom, "eleves.prenom": prenom });

    if (!listeClasse) {
      return res.status(404).json({ error: 'Classe non trouvée pour cet étudiant' });
    }

    res.json(listeClasse);
  } catch (error) {
    console.error('Erreur lors de la récupération des classes :', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Endpoint pour marquer la présence d'un élève
router.put('/listeClasses/marquerPresence/:matricule', async (req, res) => {
  try {
    const matricule = req.params.matricule;

    const listeClasses = await ListeClasse.find();

    // ... Logique pour marquer la présence de l'élève avec le matricule

    // Enregistrez les modifications dans la base de données
    await Promise.all(listeClasses.map(classe => classe.save()));

    res.json({ message: 'Présence marquée avec succès' });
  } catch (error) {
    console.error('Erreur lors de la mise à jour de la présence :', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

module.exports = router;


