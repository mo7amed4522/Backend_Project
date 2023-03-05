const db = require("../config/datatbase.js")
class usermodel {
    static async create(data, callback) {
        db.query(`insert into users values(?,?,?,?,?)`, [
            data.id,
            data.username,
            data.email,
            data.password,
            data.phoneNumber,

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
        db.query("select*from users where email=?",
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
        db.query("select*from signin",

            (error, result) => {
                if (error) {
                    callback(error)
                }
                return callback(null, result)
            }
        )

    }


}
module.exports = usermodel