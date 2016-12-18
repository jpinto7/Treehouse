var http = require('http');
var router = require('./routes.js');

var server = http.createServer(function(request, response) {
  router.home(request, response);
  router.user(request, response);
});

server.listen(3000, function() {
  console.log('Listening on port 3000');
});
