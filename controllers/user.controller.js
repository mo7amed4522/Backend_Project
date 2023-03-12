const { genSaltSync, hashSync, compareSync } = require("bcrypt")
const jwt = require('jsonwebtoken')
const usermodel = require("../models/user.js")

class userController {
    static async Register(req, res) {
        const body = req.body
        const salt = genSaltSync(15)
        await usermodel.getuserbyemail(body.email, (error, result) => {
            if (error) {
                res.json({
                    succes: 0,
                    data: error,
                });
            }
            if (result) {
                res.json({
                    succes: 0,
                    data: "eamil is already token",
                });
            } else {
                body.password = hashSync(body.password, salt);
                usermodel.create(body, (error, result) => {
                    if (error) {
                        return res.status(500).json({
                            succes: 0,
                            data: "Database connection Failer !!"
                        });
                    }
                    return res.json({
                        succes: 1,
                        data: result,
                    });
                });
            }
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
                let jsontoken = jwt.sign({ results: result }, "qwe123", {
                    expiresIn: "2h"
                });
                console.log(jsontoken);
                return res.json({
                    success: 1,
                    status: "login successfuly",
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
                succes: 0,
                data: result,
            });

        })


    }
}
module.exports = userController