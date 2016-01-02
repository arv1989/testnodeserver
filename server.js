'use strict';

const express = require('express');

// Constants
const PORT = 8080;
var versio = "nul"

if (!process.env.VERSION){
    console.log("ERR: VERSION ENV Variable is not provided")
    versio = "0.0"
}else{
    console.log("Listning to VERSION "+process.env.VERSION)
    versio = process.env.VERSION

}


// App
const app = express();
app.get('/', function (req, res) {
  res.send('Hello world\n Version : '+versio);
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
