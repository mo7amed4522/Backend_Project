require("dotenv").config()
const express=require('express')
const bodyparser=require('body-parser')
const router=require('./routes/router.js')
const app=express()
app.use(express.json())
app.use(bodyparser.urlencoded({extended:true}));
app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});
app.use(router)


app.listen(process.env.APP_PORT,(res,req)=>{
    console.log("port is running")
 })