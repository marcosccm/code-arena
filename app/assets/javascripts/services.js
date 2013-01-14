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
    internal = ace.edit('editor');
    editor   = {};

    editor.on = function(trigger, callback) {
      internal.getSession().on(trigger, function(){
        $rootScope.$apply(function(scope) {
          callback(internal);
        });
      });
    };

    return editor;
  }
];

angular.module('entryService', ['ngResource'])
       .factory('entryApi', EntryApi)
       .factory('editor', Editor)
       .factory('challengeApi', ChallengeApi)
       .factory('notificationCenter', NotificationCenter);
