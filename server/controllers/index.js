var models = require('../models');
var bluebird = require('bluebird');
var utils = require('./utils');
var db = require('../db');
//TODO: Get access to database
//Be able to post to database



module.exports = {
  messages: {
    get: function (req, res) {
      utils.sendResponse(response, {results: messages});
    }, // a function which handles a get request for all messages
    post: function (req, res) {
      //TODO: Parse the data into an object
        //Check if user does not exists in user table
          //Add user to user table
        //Submit message object to database;
        //Response End
      utils.collectData(request, function(message){
        message.objectId = ++objectId;
        messages.push(message);
        utils.sendResponse(response, {objectId: objectId}, 201);
      });
    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {

    },
    post: function (req, res) {
      //TODO: Check if user does not exist in user table
        //aAdd user to user table
    }
  }
};

