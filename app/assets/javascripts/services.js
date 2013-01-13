function NotificationCenter($rootScope){
  var notificationCenter = {};
  
  notificationCenter.message = '';

  notificationCenter.broadcast = function(message){
    this.message = message
    $rootScope.$broadcast('notification:received');
  };

  return notificationCenter;
};
NotificationCenter.$inject = ['$rootScope']

function EntryApi($resource) {
  return $resource('entries/:id', {}, {
    query: { method: 'GET', isArray: true }
  });
};
EntryApi.$inject = ['$resource']

function ChallengeApi($resource) {
  return $resource('challenge', {}, {
    query:  { method: 'GET' },
    update: { method: 'PUT' }
  });
};
ChallengeApi.$inject = ['$resource']

function Editor($rootScope) {
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
};
Editor.$inject = ['$rootScope']

angular.module('entryService', ['ngResource'])
       .factory('entryApi', EntryApi)
       .factory('editor', Editor)
       .factory('challengeApi', ChallengeApi)
       .factory('notificationCenter', NotificationCenter);
