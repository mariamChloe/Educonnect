const enseignants = require('../models/enseignants');
const { validationResult } = require('express-validator');
const bcrypt = require('bcryptjs');
const dbClient = require('../config/db');
const { v4: uuidv4 } = require('uuid');
const redisClient = require('../utils/redis');

class AuthController {
  static async postSignup(req, res) {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { matricule, password, name, confirmPassword } = req.body;

    if (!matricule || !password || !confirmPassword) {
      return res.status(400).json({ errors: true, message: 'Veuillez remplir tous les champs.' });
    }

    try {
      const existingEnseignants = await dbClient.checkEnseignants(matricule);
      if (existingEnseignants) {
        return res.status(400).json({ errors: true, message: 'Ce matricule est déjà utilisé.' });
      }

      //const hashedPassword = await bcrypt.hash(password, 12);
     // const newEnseignants = { matricule, password: hashedPassword, name };
     // await dbClient.createUser(newEnseignants);

      // Ne renvoyez pas le mot de passe haché dans la réponse
      delete newEnseignants.password;

      return res.status(201).json({ errors: false, message: 'Inscription réussie.', data: newEnseignants });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ errors: true, message: 'Erreur serveur.', error: error });
    }
  }

  static async postLogin(req, res) {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: true, message: errors.array() });
    }

    const { matricule, password } = req.body;

    if (!matricule || !password) {
      return res.status(400).json({ errors: true, message: 'Veuillez fournir un matricule et un mot de passe.' });
    }

    try {
      const logEnseignants = await dbClient.checkEnseignants(matricule);

      if (logEnseignants) {
        const hashedPassword = logEnseignants.password;

        if (hashedPassword) {
          const verificationPasswords = await bcrypt.compare(password, hashedPassword);

          if (verificationPasswords) {
            const token = uuidv4();
            const key = `EduconnectDB-${token}`;
            await redisClient.set(key, logEnseignants._id.toString(), 43200);

            // Ne renvoyez pas le mot de passe haché dans la réponse
            delete logEnseignants.password;

            return res.status(200).json({ errors: false, message: 'Connecté avec succès', data: logEnseignants, token: key });
          }
        }
      }

      return res.status(401).json({ errors: true, message: 'Matricule enseignants ou mot de passe incorrect' });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ errors: true, message: 'Erreur serveur.', error: error });
    }
  }
}

module.exports = AuthController;
