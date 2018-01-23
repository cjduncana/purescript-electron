'use strict';

const ipcMain = require('electron').ipcMain;

exports.on = function(channel) {
  return function(listener) {
    return function() {
      ipcMain.on(channel, listener);
    };
  };
};

exports.once = function(channel) {
  return function(listener) {
    return function() {
      ipcMain.once(channel, listener);
    };
  };
};

exports.removeListener = function(channel) {
  return function(listener) {
    return function() {
      ipcMain.removeListener(channel, listener);
    };
  };
};

exports.removeAllChannelListeners = function(channel) {
  return function() {
    ipcMain.removeAllListeners(channel);
  };
};

exports.removeAllListeners = function() {
  return function() {
    ipcMain.removeAllListeners();
  };
};

exports.sender = function(e) {
  return function() {
    return e.sender;
  };
};
