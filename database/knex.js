const knex = require('knex')({
    client: 'pg',
    connection: {
      host : 'ep-noisy-firefly-16356160.us-east-2.aws.neon.tech',
      port : 'ep-noisy-firefly-16356160',
      user : 'marcosbaratta',
      password : 'XHpgnoMu61KW',
      database : 'proyecto-final'
    }
  });

  module.exports = {knex};