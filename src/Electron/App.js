'use strict';

const app = require('electron').app;

exports.getAppPath = function() {
  return app.getAppPath();
};

exports.getPath = function(path) {
  return function() {
    return app.getPath(camelCaseConstructorNameFor(path));
  };
};

exports.quit = function() {
  return app.quit();
};

exports.onActivate = function(callback) {
  return function() {
    return app.on('activate', function() {
      callback();
    });
  };
};

exports.onAllWindowsClosed = function(callback) {
  return function() {
    return app.on('window-all-closed', function() {
      callback();
    });
  };
};

exports.onReady = function(callback) {
  return function() {
    return app.on('ready', function() {
      callback();
    });
  };
};

function camelCaseConstructorNameFor(value) {
  const ctorName = value.constructor.name;
  return ctorName[0].toLowerCase() + ctorName.substring(1);
}
