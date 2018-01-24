'use strict';

const app = require('electron').remote.app;

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
