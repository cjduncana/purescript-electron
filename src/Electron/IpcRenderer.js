'use strict';

const ipcRenderer  = require('electron').ipcRenderer;

exports.on = function(channel) {
  return function(listener) {
    return function() {
      ipcRenderer.on(channel, listener);
    };
  };
};

exports.once = function(channel) {
  return function(listener) {
    return function() {
      ipcRenderer.once(channel, listener);
    };
  };
};

exports.removeListener = function(channel) {
  return function(listener) {
    return function() {
      ipcRenderer.removeListener(channel, listener);
    };
  };
};

exports.removeAllListeners = function(channel) {
  return function() {
    ipcRenderer.removeAllListeners(channel);
  };
};

exports.removeAllChannelListeners = function() {
  return function() {
    ipcRenderer.removeAllListeners();
  };
};

exports.send = function(channel) {
  return function(arg) {
    return function() {
      ipcRenderer.send(channel, arg);
    };
  };
};

exports.sendSync = function(channel) {
  return function(arg) {
    return function() {
      ipcRenderer.sendSync(channel, arg);
    };
  };
};

exports.sendToHost = function(channel) {
  return function(arg) {
    return function() {
      ipcRenderer.sendToHost(channel, arg);
    };
  };
};
