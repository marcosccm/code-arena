function NotificationCrtl($scope, notificationCenter) {
  $scope.$on('notification:received', function(message){
    $scope.message = notificationCenter.message;
  });
}

function CurrentChallengeCrtl($scope, challengeApi, notificationCenter) {
  $scope.challenge = challengeApi.query();

  $scope.edit = function(){
    challengeApi.update($scope.challenge, function(resp){
      $scope.challenge = challengeApi.query();
      notificationCenter.broadcast(resp.message);
    });
  };
}

function EntryListCrtl($scope, entryApi, notificationCenter) {
  $scope.entries = entryApi.query();

  $scope.submit = function(){
    entryApi.save($scope.entry, function(resp){
      $scope.entries = entryApi.query();
      notificationCenter.broadcast(resp.message);
    });
  };
}

