'use strict';

const app = require('electron').remote.app;

exports.getAppPath = function() {
  return app.getAppPath();
};

exports.getPath = function(path) {
  return function() {
    return app.getPath(camelCaseConstructorNameFor(path));
  };
};

exports.quit = function() {
  app.quit();
};

function camelCaseConstructorNameFor(value) {
  const ctorName = value.constructor.name;
  return ctorName[0].toLowerCase() + ctorName.substring(1);
}
