const knex = require('knex')({
    client: 'pg',
    connection: {
      host : 'localhost',
      port : 5432,
      user : 'postgres',
      password : 'pingpong',
      database : 'backend'
    }
  });

  module.exports = {knex};