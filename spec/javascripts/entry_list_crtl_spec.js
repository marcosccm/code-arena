describe('EntryListCrtl', function(){
  var scope, entryService, notificationCenter, entries;

  beforeEach(function() {
    scope = {};
    notificationCenter = {
      broadcast: function(){} 
    };
    entryService = { 
      query: function(){}, 
      save: function(e,cb) { cb({}); }  
    };
    entries = ['entry1', 'entry2'];
    crtl  = new EntryListCrtl(scope, entryService, notificationCenter);
  });

  it('instatiate entries from server response', function(){
    spyOn(entryService, 'query').andReturn(entries)
    crtl  = new EntryListCrtl(scope, entryService, notificationCenter);
    expect(scope.entries).toEqual(entries);
  });

  describe('submiting challenges entries', function(){
    it('saves the entry', function(){
      spyOn(entryService, 'save')
      scope.submit();
      expect(entryService.save).toHaveBeenCalled();
    });

    it('reloads the entry list', function(){
      spyOn(entryService, 'query').andReturn(entries)
      scope.submit();
      expect(scope.entries).toEqual(entries);
    });

    it('broadcasts server response message', function(){
      spyOn(notificationCenter, 'broadcast')
      scope.submit();
      expect(notificationCenter.broadcast).toHaveBeenCalled();
    });
  });
});
