var Profile = require('./profile.js');

function home(request, response) {
  if (request.url === '/') {
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.write('Head\n');
    response.write('Search\n');
    response.end('Footer\n');
  }
}

function user(request, response) {
  var username = request.url.replace('/', '');
  if (username.length > 0) {
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.write('Head\n');

    var studentProfile = new Profile(username);

    studentProfile.on('end', function(profileJSON) {
      var values = {
        avatarUrl: profileJSON.gravatar_url,
        username: profileJSON.profile_name,
        badges: profileJSON.badges.length,
        javascriptPoints: profileJSON.points.JavaScript
      }

      response.write(values.username + ' has ' + values.badges + ' badges\n');
      response.end('Footer\n');
    });

    studentProfile.on('error', function(error) {
      response.write(error.message + '\n');
      response.end('Footer\n');
    });

  }
}


module.exports.home = home;
module.exports.user = user;
