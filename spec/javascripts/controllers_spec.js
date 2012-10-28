describe('EntryListCrtl', function(){
  var scope, crtl, $http;

  beforeEach(function(){
    inject(function(_$httpBackend_,$rootScope,$controller){
      $http = _$httpBackend_;
      $http.expectGET('/entries').respond([
        { title: 'entry 1'},
        { title: 'entry 2'}
      ]);
  
      scope = $rootScope.$new();
      crtl  = $controller(EntryListCrtl,{$scope: scope});
    });
  });

  it('instatiate entries from server response', function(){
    $http.flush();
    expect(scope.entries.length).toBe(2);
  });
});
