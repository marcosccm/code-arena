describe('EntryListCrtl', function(){
  var scope, entriesApi, entries;

  beforeEach(function() {
    scope = {};
    entriesApi = { query: function(){}, };
    entries = ['entry1', 'entry2'];
  });

  it('instatiate entries from server response', function(){
    spyOn(entriesApi, 'query').andReturn(entries)
    new EntryListCrtl(scope, entriesApi);
    expect(scope.entries).toEqual(entries);
  });
});
