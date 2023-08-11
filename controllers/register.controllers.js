const {knex} = require("../database/knex");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { matchedData } = require("express-validator");

const secret = 'ni idea men';
exports.secret = secret;
exports.register = async (req, res, next) => {
    const salt = await bcrypt.genSalt(10);
    const hashContrasenia = await bcrypt.hash(req.body.password, salt);
  
    await knex("users").insert({ ...req.body, password: hashContrasenia });
    console.log('registro');
  
    sendToken(res, next, req.body.email, req.body.name);
  };

  exports.login = async (req, res, next) => {
    const { email, password } = req.body;
  
    const user = await knex("users").where("email", email).first();
  
    if (!user) {
      res.status(404).json({ mensje: "usuario/contraseña incorrecta" });
      return next();
    }
  
    const contraseniaValida = await bcrypt.compare(
      password,
      user.password
    );
  
    if (!contraseniaValida) {
      res.status(404).json({ mensje: "usuario/contraseña incorrecta" });
      return next();
    }
  
    sendToken(res, next, email, user.name);
  };
  

  const sendToken = (res, next, email, nombre) => {
    const token = jwt.sign({ email, nombre }, secret);
    res.json({ token });
    next();
  };


