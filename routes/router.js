const express = require('express')
const usercontroller = require('../controllers/user.controller.js')
const router = express.Router()
const  tokenVaild  = require("../auth/token_vaild.js");
const upload = require('multer')();

router.post('/register' ,upload.any(),usercontroller.Register);
router.post('/login', upload.any(),usercontroller.login);
router.get('/getusers', upload.any(),tokenVaild.checkToken ,usercontroller.getalluser);



module.exports = router