const { genSaltSync, hashSync, compareSync } = require("bcrypt")
const jwt = require('jsonwebtoken')
const supermodel = require("../models/user.js")

class userController {
    static async Register(req, res) {
        const body = req.body
        const salt = genSaltSync(15)
        await supermodel.getuserbyemail(body.email, (error, result) => {
            if (error) {
                res.json({
                    success: 0,
                    data: error,
                });
            }
            if (result) {
               res.json({
                success : 0
               })
            } else {
                body.password = hashSync(body.password, salt);
                supermodel.create(body, (error, result) => {
                    if (error) {
                        return res.status(500).json({
                            success: 0,
                            data: "Database connection Failed !!"
                        });
                    }
                    return res.json({
                        success: 1,
                        data: result,
                    });
                });
            }
        })
    }
    static async login(req, res) {
        const body = req.body
        supermodel.getuserbyemail(body.email, (error, result) => {
            if (error) {
                console.log("error", error)
            }
            if (!result) {
               return res.json({
                    success: 0,
                    data: "invalid email or password"
                })
            }
            const results = compareSync(body.password, result.password);
            if (results) {
                result.password = undefined;
                let jsonwebtoken = jwt.sign({ results: result }, "qwe123", {
                    expiresIn: "2h"
                });
                return res.json({
                    success: 1,
                    status: "login successfully",
                    token: jsonwebtoken

                })
            }
            else {
                res.json({
                    success: 0,
                    massage: "invalid password"
                })
            }

        })


    }

    static async getalluser(req, res) {
        const body = req.body
        supermodel.getalluser((error, result) => {
            if (error) {
                console.log("error", error)
            }
            res.json({
                success: 0,
                data: result,
            });

        })


    }
}
module.exports = userController