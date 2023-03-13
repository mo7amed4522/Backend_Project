const db = require("../config/datatbase.js")
class supermodel {
    static async create(data, callback) {
        db.query(`INSERT INTO users VALUES(?,?,?)`, [
            data.id,
            data.email,
            data.password,


        ],
            (error, result) => {
                if (error) {
                    return callback(error);
                }
                return callback(null, result);

            }
        )

    }

    static async getuserbyemail(email, callback) {
        db.query("SELECT * FROM users WHERE email=?",
            [email],
            (error, result) => {
                if (error) {
                    callback(error)
                }
                return callback(null, result[0])
            }
        )

    }

    static async getalluser(callback) {
        db.query("SELECT * FROM users",

            (error, result) => {
                if (error) {
                    callback(error)
                }
                return callback(null, result)
            }
        )

    }


}
module.exports = supermodel