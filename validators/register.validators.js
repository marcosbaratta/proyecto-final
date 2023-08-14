const { checkSchema } = require("express-validator");
const {knex} = require('../database/knex');

const nameLengths = { min: 3, max: 20 };
const passwordLengths = { min: 8 };

module.exports = checkSchema({
    name: {
      in: ["body"], 
      errorMessage: `Es requerido y el largo es entre ${nameLengths.min} y ${nameLengths.max} caracteres`,
      optional: false,
      isLength: {
        options: nameLengths,
      },
      custom: {
        options: async (value) => {
          const queryResponse = await knex("users").where({
            name: value,
          });
          const user = queryResponse[0];
          if (user) {
            throw new Error("Ya existe un usuario con ese username");
          }
          return true;
        },
      },
    },
  
    email: {
      in: ["body"],
      errorMessage:
        "Es un campo requerido y deber terner el formato de un email (user@example.com)",
      isEmail: true,
      optional: false,
      custom: {
        options: async (value) => {
          const queryResponse = await knex("users").where({
            email: value,
          });
          const user = queryResponse[0];
          if (user) {
            throw new Error("Ya existe un usuario con ese email");
          }
          return true;
        },
      },
    },
    password: {
        in: ["body"], 
        errorMessage: `Es requerido y el largo minimo es de ${passwordLengths}`,
        optional: false,
        isLength: {
          options: passwordLengths,
        }
  }});
  