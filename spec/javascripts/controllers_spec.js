describe('EntryListCrtl', function(){
  var scope, entryService, entries;

  beforeEach(function() {
    scope = {};
    entryService = { 
      query: function(){}, 
      save: function(e,cb) { cb(); }  
    };
    entries = ['entry1', 'entry2'];
  });

  it('instatiate entries from server response', function(){
    spyOn(entryService, 'query').andReturn(entries)
    crtl  = new EntryListCrtl(scope, entryService);
    expect(scope.entries).toEqual(entries);
  });

  describe('submiting challenges entries', function(){
    beforeEach(function(){
      crtl  = new EntryListCrtl(scope, entryService);
    });

    it('saves the entry', function(){
      spyOn(entryService, 'save')
      scope.submit();
      expect(entryService.save).toHaveBeenCalled();
    });
  });
});
