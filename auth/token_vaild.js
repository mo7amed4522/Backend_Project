const { verify, decode } = require("jsonwebtoken");
const userController = require('../controllers/user.controller');
class tokenVaild {
    static async checkToken(req, res, next) {
        let token = req.get("authorization");
        if (token) {
            token = token.slice(7);
            verify(token, "qwe123", (err, decode) => {
                if (err) {
                    res.json({
                        success: 0,
                        data: "Invaild Token !!",
                    });
                } else {
                    next();
                }
            });
        } else {
            res.json({
                success: 0,
                data: "Access denied !! unautorized user",
            });
        }
    }


}
module.exports = tokenVaild;