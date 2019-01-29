var restify = require("restify");
var mysql = require("mysql");
var corsMiddleware = require("restify-cors-middleware"); 

var con = {
  host: "localhost",
  user: "root",
  password: "root",
  database: "ec021_av2_bestflix",
};

function listarGenero(req, res, next) {

    res.setHeader("content-type", "application/json");
    res.charSet("UTF-8");
  
    var connection = mysql.createConnection(con);
    connection.connect();
  
    var strQuery = "SELECT genero_id, descricao FROM genero";
  
    console.log(strQuery);
  
    connection.query(strQuery, function(err, rows, fields) {
      if (!err) {
        
        res.json(rows); 
      } else {
      
        res.json(err); 
      }
    });
  
    connection.end();
  
    next();
  }

  function buscarFilmePorGenero(req, res, next) {

    res.setHeader("content-type", "application/json");
    res.charSet("UTF-8");
  
    var connection = mysql.createConnection(con);
    connection.connect();
    
    var strQuery = "SELECT filme_id, titulo, ano_lancamento, genero_id FROM filme WHERE genero_id = " + req.query.genero_id;
  
    console.log(strQuery);
  
    connection.query(strQuery, function(err, rows, fields) {
      if (!err) {
       
        res.json(rows); 
      } else {
    
        res.json(err);
      }
    });
  
    connection.end();
  
    next();
  }

var server = restify.createServer({ name: "AV2" });

server.use(restify.plugins.bodyParser());

server.use(restify.plugins.queryParser());

const cors = corsMiddleware({
  origins: ["*"],
  allowHeaders: ["API-Token"],
  exposeHeaders: ["API-Token-Expiry"]
});

server.pre(cors.preflight);
server.use(cors.actual);

var bestflixPoint = "/bestflix";

server.get(bestflixPoint + "/listarGenero", listarGenero);
server.get(bestflixPoint + "/buscarFilmePorGenero", buscarFilmePorGenero);

var port = process.env.PORT || 5000;

server.listen(port, function() {
  console.log("%s rodando", server.name);
});