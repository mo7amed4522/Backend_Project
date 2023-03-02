const { genSaltSync, hashSync, compareSync } = require("bcrypt")
const jwt = require('jsonwebtoken')
const usermodel = require("../models/user.js")

class userController {
    static async create_user(req, res) {
        const body = req.body
        const salt = genSaltSync(10)
        body.password = hashSync(body.password, salt)
        usermodel.create(body, (error, result) => {
            if (error) {
                console.log(error)
                return res.status(500).json({
                    success: 0,
                    massage: "db connection error"
                })
            }
            return res.json({
                success: 1,
                data: result
            })
        })
    }
    static async login(req, res) {
        const body = req.body
        usermodel.getuserbyemail(body.email, (error, result) => {
            if (error) {
                console.log("error", error)
            }
            if (!result) {
                res.json({
                    succes: 0,
                    data: "invalid email or password"
                })
            }
            const results = compareSync(body.password, result.password);
            if (results) {
                result.password = undefined;
                const jsontoken = jwt.sign({ results: result }, "qwe123");
                return res.json({
                    success: 1,
                    status: "login successfuly",
                    data:req.body,
                    token: jsontoken

                })
            }
            else {
                res.json({
                    succes: 0,
                    massage: "invalid password"
                })
            }

        })


    }

    static async getalluser(req, res) {
        const body = req.body
        usermodel.getalluser((error, result) => {
            if (error) {
                console.log("error", error)
            }
             res.json({
                succes:0,
                data:result,
             });

        })


    }
}
module.exports = userController