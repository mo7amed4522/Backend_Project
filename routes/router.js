const express=require('express')
const usercontroller=require('../controllers/user.controller.js')
const router =express.Router()

router.post('/register',usercontroller.create_user,);
router.post('/login',usercontroller.login);
router.get('/getusers',usercontroller.getalluser);



module.exports=router