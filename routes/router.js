const express = require('express')
const usercontroller = require('../controllers/user.controller.js')
const hotelController = require('../controllers/hotel.controller.js')
const router = express.Router()
const tokenVaild = require("../auth/token_vaild.js");
const upload = require('multer')();

// =============== users ==============//
router.post('/register', upload.any(), usercontroller.Register);
router.post('/login', upload.any(), usercontroller.login);
router.get('/getusers', upload.any(), tokenVaild.checkToken, usercontroller.getalluser);
// =============== hotel ==============//
router.get('/hotel/getAllData',upload.any(),hotelController.getAllHotell);

module.exports = router