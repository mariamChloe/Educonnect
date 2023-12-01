const router = require('express').Router();
const enseignantsController = require('../controller/enseignantsController');
router.post('/login',enseignantsController.register);
module.exports = router;