require("dotenv").config()
const express = require('express')
const bodyparser = require('body-parser')
const router = require('./routes/router.js')
const app = express()
app.use(express.json())
app.use(bodyparser.urlencoded({ extended: true }));


app.use(router)


app.listen(process.env.APP_PORT, (res, req) => {
    console.log("port is running")
})
