function EntryListCrtl($scope, Entry) {
  $scope.entries = Entry.query();
}
