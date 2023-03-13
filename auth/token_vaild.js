const { verify, decode } = require("jsonwebtoken");
class tokenVaild {
    static async checkToken(req, res, next) {
        let token = req.get("authorization");
        if (token) {
            token = token.slice(7);
            verify(token, "qwe123", (err, decode) => {
                if (err) {
                    res.json({
                        success: 0,
                        data: "Invalid Token !!",
                    });
                } else {
                    next();
                }
            });
        } else {
            res.json({
                success: 0,
                data: "Access denied !! unauthorized user",
            });
        }
    }


}
module.exports = tokenVaild;