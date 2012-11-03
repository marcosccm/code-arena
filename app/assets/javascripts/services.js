function NotificationCenter($rootScope){
  var notificationCenter = {};
  
  notificationCenter.message = '';

  notificationCenter.broadcast = function(message){
    this.message = message
    $rootScope.$broadcast('notification:received');
  };

  return notificationCenter;
};

function EntryApi($resource) {
  return $resource('entries/:id', {}, {
    query: { method: 'GET', isArray: true }
  });
};


angular.module('entryService', ['ngResource'])
       .factory('entryApi', EntryApi)
       .factory('notificationCenter', NotificationCenter);
