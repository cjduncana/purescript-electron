'use strict';

const app = require('electron').app;

exports.getAppPath = function() {
  return app.getAppPath();
};

exports.getPath_ = function(path) {
  return function() {
    return app.getPath(path);
  };
};

exports.quit = function() {
  app.quit();
};

exports.onActivate = function(callback) {
  return function() {
    app.on('activate', function() {
      callback();
    });
  };
};

exports.onAllWindowsClosed = function(callback) {
  return function() {
    app.on('window-all-closed', function() {
      callback();
    });
  };
};

exports.onReady = function(callback) {
  return function() {
    app.on('ready', function() {
      callback();
    });
  };
};
