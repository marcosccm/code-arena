function EntryListCrtl($scope, $http) {
  $http.get('/entries').success(function(data) {
    $scope.entries = data
  });
}
