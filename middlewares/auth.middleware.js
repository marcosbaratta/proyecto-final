const jwt = require('jsonwebtoken');



const secret = 'ni idea men';
exports.userAuthentication = (req, res, next) =>{
    const headerToken = req.headers['token'];
    jwt.verify(headerToken, secret, (error, decoded)=>{
        if(error){
            return res.status(403).json({mensaje: 'invalid token'})
        }
        return next()
    } )
}