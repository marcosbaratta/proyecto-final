const knex = require('knex')({
    client: 'pg',
    connection: {
      host : 'ep-noisy-firefly-16356160.us-east-2.aws.neon.tech',
      port : 5432,
      user : 'marcosbaratta',
      password : 'XHpgnoMu61KW',
      database : 'proyecto-final',
      ssl: true,
      sslmode: 'verify-full'
    }
  });

  module.exports = {knex};