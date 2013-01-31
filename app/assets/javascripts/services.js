var NotificationCenter = [
  '$rootScope',
  function($rootScope){
    var notificationCenter = {};
    
    notificationCenter.message = '';

    notificationCenter.broadcast = function(message){
      this.message = message
      $rootScope.$broadcast('notification:received');
    };

    return notificationCenter;
  }
];

var EntryApi = [
  '$resource',
  function($resource) {
    return $resource('entries/:id', {}, {
      query: { method: 'GET', isArray: true }
    });
  }
];

var ChallengeApi = [
  '$resource',
  function($resource) {
    return $resource('challenge', {}, {
      query:  { method: 'GET' },
      update: { method: 'PUT' }
    });
  }
];

var Editor = [
  '$rootScope',
  function($rootScope) {
    internal = {};
    editor   = {};

    editor.init  = function(container) {
      internal = ace.edit(container);
      return this;
    }

    editor.setMode  = function(language) {
      internal.getSession().setMode("ace/mode/" + language.toLowerCase());
      return this;
    };

    editor.setContent = function(content) {
      internal.getSession().setValue(content);
      return this;
    }

    editor.on = function(trigger, callback) {
      internal.getSession().on(trigger, function(){
        callback(internal);
      });
      return this;
    };

    return editor;
  }
];

angular.module('entryService', ['ngResource'])
       .factory('entryApi', EntryApi)
       .factory('editor', Editor)
       .factory('challengeApi', ChallengeApi)
       .factory('notificationCenter', NotificationCenter);
