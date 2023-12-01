import { eleves } from '../models/eleve';

// Fonction pour marquer l'assiduité de l'élève
export async function marquerAssiduite(req, res) {
  try {
    const { eleveId, date, present } = req.body;

    // Recherche de l'élève par ID
    const eleve = await findById(eleveId);

    if (!eleve) {
      return res.status(404).json({ message: 'Élève non trouvé' });
    }

    // Ajouter une entrée dans le tableau d'assiduité
    eleve.assiduite.push({ date, present });

    // Enregistrement des modifications
    await eleve.save();

    res.status(200).json({ message: 'Assiduité marquée avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erreur serveur' });
  }
}

// Fonction pour enregistrer les notes de l'élève
export async function enregistrerNotes(req, res) {
  try {
    const { eleveId, matiere, note } = req.body;

    // Recherche de l'élève par ID
    const eleve = await findById(eleveId);

    if (!eleve) {
      return res.status(404).json({ message: 'Élève non trouvé' });
    }

    // Ajouter une entrée dans le tableau de notes
    eleve.notes.push({ matiere, note });

    // Enregistrement des modifications
    await eleve.save();

    res.status(200).json({ message: 'Notes enregistrées avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erreur serveur' });
  }
}
