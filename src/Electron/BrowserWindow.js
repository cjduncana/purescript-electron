'use strict';

exports.newBrowserWindow = function(options) {
  // require('electron') on demand so test suites can still run under node
  const { BrowserWindow } = require('electron');

  return function() {
    return new BrowserWindow(options);
  };
};

exports.close = function(browserWindow) {
  return function() {
    browserWindow.close();
  };
};

exports.loadURL = function(browserWindow) {
  return function(url) {
    return function() {
      return browserWindow.loadURL(url);
    };
  };
};

exports.minimize = function(browserWindow) {
  return function() {
    browserWindow.minimize();
  };
};

exports.show = function(browserWindow) {
  return function() {
    browserWindow.show();
  };
};

exports.onClose = function(browserWindow) {
  return function(callback) {
    return function() {
      return browserWindow.on('close', function() {
        callback();
      });
    };
  };
};

exports.onClosed = function(browserWindow) {
  return function(callback) {
    return function() {
      return browserWindow.on('closed', function() {
        callback();
      });
    };
  };
};

exports.onceReadyToShow = function(browserWindow) {
  return function(callback) {
    return function() {
      return browserWindow.once('ready-to-show', function() {
        callback();
      });
    };
  };
};

exports.webContents = function(browserWindow) {
  return function() {
    return browserWindow.webContents;
  };
};

exports.onDidFinishLoad = function(webContent) {
  return function(callback) {
    return function() {
      return webContent.on('did-finish-load', function() {
        callback();
      });
    };
  };
};

exports.onDidGetRedirectRequest = function(webContents) {
  return function(callback) {
    return function() {
      return webContents.on('did-get-redirect-request', function(e, oldURL, newURL, isMainFrame, httpResponseCode, requestMethod, referrer, headers) {
        callback(e)(oldURL)(newURL)(isMainFrame)(httpResponseCode)(requestMethod)(referrer)(headers)();
      });
    };
  };
};

exports.onDidNavigate = function(webContents) {
  return function(callback) {
    return function() {
      return webContents.on('did-navigate', function(e, url) {
        callback(e)(url)();
      });
    };
  };
};

exports.onDidNavigateInPage = function(webContents) {
  return function(callback) {
    return function() {
      return webContents.on('did-navigate-in-page', function(e, url) {
        callback(e)(url)();
      });
    };
  };
};

exports.onDomReady = function(webContents) {
  return function(callback) {
    return function() {
      return webContents.on('dom-ready', function(e) {
        callback(e)();
      });
    };
  };
};

exports.onNewWindow = function(webContents) {
  return function(callback) {
    return function() {
      return webContents.on('new-window', function(e, url) {
        callback(e)(url)();
      });
    };
  };
};

exports.onWillNavigate = function(webContents) {
  return function(callback) {
    return function() {
      return webContents.on('will-navigate', function(e, url) {
        callback(e)(url)();
      });
    };
  };
};

exports.openDevToolsImpl = function(webContents) {
  return function(options) {
    return function() {
      webContents.openDevTools(options);
      return {};
    };
  };
};

exports.send = function(webContents) {
  return function(channel) {
    return function(arg) {
      return function() {
        webContents.send(channel, arg);
        return {};
      };
    };
  };
};
