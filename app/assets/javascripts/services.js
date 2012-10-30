angular.module('entryService', ['ngResource'])
       .factory('Entry', function($resource){
          return $resource('entries/:id', {}, {
            query: { method: 'GET', isArray: true },
          });
        });
