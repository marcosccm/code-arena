function NotificationCrtl($scope, notificationCenter) {
  $scope.$on('notification:received', function(message){
    $scope.message = notificationCenter.message;
  });
}

function CurrentChallengeCrtl($scope, challengeApi) {
  $scope.challenge = challengeApi.query();
}

function EditChallengeCrtl($scope, challengeApi, notificationCenter, $location) {
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

function AddChallengeEntryCrtl($scope, entryApi, notificationCenter, $location, editor){
  $scope.entry = {};

  editor.on('change', function(editor){
    $scope.entry.content = editor.getValue();
  });

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

function EntryListCrtl($scope, entryApi) {
  $scope.entries = entryApi.query();
}
