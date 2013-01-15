var NotificationCrtl = [
  '$scope', 'notificationCenter', 
  function($scope, notificationCenter) {
    $scope.$on('notification:received', function(message){
      $scope.message = notificationCenter.message;
    });
  }
];

var CurrentChallengeCrtl = [
 '$scope', 'challengeApi',
  function($scope, challengeApi) {
    $scope.challenge = challengeApi.query();
  }
];

var EditChallengeCrtl = [
  '$scope', 'challengeApi', 'notificationCenter', '$location',
  function($scope, challengeApi, notificationCenter, $location) {
    $scope.challenge = challengeApi.query();

    $scope.edit = function(){
      challengeApi.update($scope.challenge, function(resp){
        notificationCenter.broadcast(resp.message);
        $location.path('/');
      });
    };

    $scope.cancel = function(){
      $location.path('/');
    };
  }
];

var AddChallengeEntryCrtl = [
  '$scope', 'entryApi', 'notificationCenter', '$location', 'editor',
  function($scope, entryApi, notificationCenter, $location, editor){
    $scope.entry = {};

    editor.on('change', function(editor){
      $scope.entry.content = editor.getValue();
    });
    
    $scope.changeLanguage = function() {
      editor.setMode($scope.entry.language);
    };

    $scope.submit = function(){
      entryApi.save($scope.entry, function(resp){
        notificationCenter.broadcast(resp.message);
        $location.path('/');
      });
    };

    $scope.cancel = function(){
      $location.path('/');
    };
  }
];

var EntryListCrtl = [
  '$scope', 'entryApi',
  function($scope, entryApi) {
    $scope.entries = entryApi.query();
  }
];
