const hotelModel =require ('../models/hotel.js');

class hotelController{
    static async getAllHotell(req,res){
        const body = req.body;
        hotelModel.getallhotel((error,result)=>{
            if(error){
                res.json({
                    success: 1,
                    data: error,
                })
            }
            res.json({
                success: 0,
                data: result,
            })
        });
    }
}

module.exports = hotelController;