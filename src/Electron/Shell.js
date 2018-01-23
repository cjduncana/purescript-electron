'use strict';

const shell = require('electron').shell;

exports.showItemInFolder = function(fullPath) {
  return function() {
    shell.showItemInFolder(fullPath);
  };
};

exports.openItem = function(fullPath) {
  return function() {
    shell.openItem(fullPath);
  };
};

exports.openExternal = function(url) {
  return function() {
    shell.openExternal(url);
  };
};

exports.moveItemToTrash = function(fullPath) {
  return function() {
    return shell.moveItemToTrash(fullPath);
  };
};

exports.beep = function() {
  shell.beep();
};
