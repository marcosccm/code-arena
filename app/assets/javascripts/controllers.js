function EntryListCrtl($scope, Entry) {
  $scope.entries = Entry.query();

  $scope.submit = function(){
    Entry.save($scope.entry, function(resp){
      $scope.message = resp.message;
      $scope.entries = Entry.query();
    });
  };
}
