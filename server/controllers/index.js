var models = require('../models');
var bluebird = require('bluebird');
var utils = require('../utils');
var db = require('../db');
//TODO: Get access to database
//Be able to post to database



module.exports = {
  messages: {
    get: function (req, res) {
      var data = db.connection.query('SELECT Users.username, Messages.message, Messages.roomname FROM Users, Messages WHERE id_Users = Users.id;');
      console.log("Get Data ------===========>" + JSON.stringify(data));
      res.writeHead(statusCode, headers);
      res.end(JSON.stringify(data));
    }, // a function which handles a get request for all messages
    post: function (req, res) {

      //TODO: Parse the data into an object
      console.log("-------------------> on message POST req.body" + req.body);
      // var key = db.connection.query('SELECT name ')
      // console.log('INSERT into `MESSAGES` (`message`, `id_users`) SELECT \'' + req.body.message  + '\', USERS.id FROM Users WHERE Users.username = \'' + req.body.username + '\';');
      db.connection.query('INSERT into `MESSAGES` (`message`, `id_users`) SELECT \'' + req.body.message  + '\', Users.id FROM Users WHERE Users.username = \'' + req.body.username + '\';');
      res.end();
        //Check if user does not exists in user table
          //Add user to user table
        //Submit message object to database;
        //Response End
      // utils.collectData(req, function(message){
      //   // message.objectId = ++objectId;
      //   var object = db.connection.query('INSERT INTO Messages SET?', req.body, function(err, result){
      //     if(err) {
      //       console.log('error');
      //     } else {

      //     }
      //   });
      //   utils.sendResponse(response, object, 201);
      // });
    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {

    },
    post: function (req, res) {

      console.log("-------------------> POST on USER req.body" + req.body.username);
      db.connection.query('INSERT INTO Users SET ?', req.body, function(err, result) {
        //
      });
      res.end();
      //TODO: Check if user does not exist in user table
        //aAdd user to user table
    }
  }
};

var headers = {
  "access-control-allow-origin": "*",
  "access-control-allow-methods": "GET, POST, PUT, DELETE, OPTIONS",
  "access-control-allow-headers": "content-type, accept",
  "access-control-max-age": 10, // Seconds.
  'Content-Type': "application/json"
};