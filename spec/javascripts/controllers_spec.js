describe('EntryListCrtl', function(){
  var scope, entryService, entries;

  beforeEach(function() {
    scope = {};
    entryService = { query: function(){} };
    entries = ['entry1', 'entry2'];
  });

  it('instatiate entries from server response', function(){
    spyOn(entryService, 'query').andReturn(entries)

    crtl  = new EntryListCrtl(scope, entryService);
    expect(scope.entries).toEqual(entries);
  });
});
