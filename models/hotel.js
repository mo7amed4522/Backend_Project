const db = require("../config/datatbase.js")
class hotelModel {
    static async getallhotel(callback) {
        db.query("SELECT * FROM hotel",

            (error, result) => {
                if (error) {
                    return callback(error);
                }
                return callback(null, result);
            });
    }
}
module.exports = hotelModel;