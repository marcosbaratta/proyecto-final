const knex = require("../database/knex");
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

  const sendToken = (res, next, email, nombre) => {
    const token = jwt.sign({ email, nombre }, secret);
    res.json({ token });
    next();
  };

// exports.createUser = async (req, res, next) => {
//   const newUser = matchedData(req);
//   try {
//     const respuestaBd = await knex('users').insert(newUser, "*");
//     res.status(201);
//     res.json(respuestaBd[0]);
//   } catch (e) {
//     res.status(500);
//     res.json(e);
//   }
//   next();
// };
