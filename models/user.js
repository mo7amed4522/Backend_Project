const db = require("../config/datatbase.js")
class usermodel {
    static async create(data, callback) {
        db.query(`insert into signin values(?,?,?)`, [
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
        db.query("select*from signin where email=?",
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