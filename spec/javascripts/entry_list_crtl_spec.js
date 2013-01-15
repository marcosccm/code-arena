describe('EntryListCrtl', function(){
  var scope, entriesApi, entries;

  beforeEach(inject(function($controller) {
    scope = {};
    entriesApi = { query: function(){}, };
    entries = ['entry1', 'entry2'];

    spyOn(entriesApi, 'query').andReturn(entries)
    $controller(EntryListCrtl, { $scope: scope, entryApi: entriesApi});
  }));

  it('instatiate entries from server response', function(){
    expect(scope.entries).toEqual(entries);
  });
});
