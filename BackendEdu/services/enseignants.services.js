const enseignantSchema = require('../models/enseignants')

class EnseignantsService{
static async registerEnseigants(matricule,password){
    try {
        const createEnseignants = new enseignantSchema({matricule,password});
        return await createEnseignants.save();

    }catch(error) {
        throw error;
    }

}
}
module.exports = EnseignantsService;