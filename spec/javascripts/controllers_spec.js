describe('EntryListCrtl', function(){
  it('instatiate entries with 2 elemens', function(){
    var scope = {};
    var crtl  = new EntryListCrtl(scope);

    expect(scope.entries.length).toBe(2);
  });
});
