const express = require("express");
const app = express();
app.use(express.json());
const port = 3001;
const routes = require('./routes/index');


const postgres = require('postgres');
require('dotenv').config();

// const { PGHOST, PGDATABASE, PGUSER, PGPASSWORD, ENDPOINT_ID } = process.env;
// const URL = `postgres://${PGUSER}:${PGPASSWORD}@${PGHOST}/${PGDATABASE}?options=project%3D${ENDPOINT_ID}`;

// const sql = postgres(URL, { ssl: 'require' });

// async function getPgVersion() {
//   const result = await sql`select version()`;
//   console.log(result);
// }

// getPgVersion();


app.use("/", routes);


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});


module.exports = app;