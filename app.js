const express = require("express");
const cors = require("cors");
const app = express();
app.use(express.json());
app.use(cors({origin:'*'}));
const port = 3001;
const routes = require('./routes/index');







app.use("/", routes);




app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});


module.exports = app;