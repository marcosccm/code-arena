//= require jquery
//= require angular
//= require controllers
//= require services
//= require angular-resource

angular.module('codearena',['entryService']).config(function($routeProvider){
  $routeProvider.
  when('/', { controller: CurrentChallengeCrtl, templateUrl: 'current_challenge.html' }).
  when('/edit', { controller: EditChallengeCrtl, templateUrl: 'edit_challenge.html' });
});
