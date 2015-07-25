var models = require('../models');
var bluebird = require('bluebird');
var utils = require('../utils');
var db = require('../db');
//TODO: Get access to database
//Be able to post to database



module.exports = {
  messages: {
    get: function (req, res) {
      db.connection.query('SELECT * FROM Messages;', function(err, message){
        // console.log("Get Data ------===========>" + JSON.stringify(message));
        res.writeHead(200, headers);
        res.end(JSON.stringify(message));
      });
    }, // a function which handles a get request for all messages
    post: function (req, res) {

      //TODO: Parse the data into an object
      // var key = db.connection.query('SELECT name ')
      db.connection.query('INSERT IGNORE INTO Users SET ?', req.body, function(err, result) {
        if(err) {
          console.log(err);
        } else {
          console.log('post success');
        }
      });
      db.connection.query('INSERT into `MESSAGES` SET ?', req.body, function(err, result) {
        if(err) {
          console.log(err);
        } else {
          console.log('post success');
          res.writeHead(200, headers);
          res.end();
        }
      });
    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {

    },
    post: function (req, res) {
      // db.connection.query('INSERT IGNORE INTO `USERS` (`username`) VALUES (\'' + req.body.username + '\');');
      db.connection.query('INSERT IGNORE INTO Users SET ?', req.body, function(err, result) {
        if(err) {
          console.log(err);
        } else {
          console.log('post success');
          res.writeHead(200, headers);
          res.end();
        }
      });
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