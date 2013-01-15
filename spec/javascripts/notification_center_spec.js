describe('NotficiationCenter', function(){
  var rootScope, notificationCenter;

  beforeEach(inject(function($injector){
    rootScope = jasmine.createSpyObj('rootScope', ['$broadcast']);
    notificationCenter = $injector.instantiate(NotificationCenter,  { $rootScope: rootScope});
  }));

  it('starts with a blank message', function(){
    expect(notificationCenter.message).toEqual('');
  });

  describe('when broadcasting messages', function(){
    it('send messages through the rootScope', function(){
      notificationCenter.broadcast('something happened');
      expect(rootScope.$broadcast).toHaveBeenCalledWith('notification:received');
    });

    it('changes the service message', function(){
      notificationCenter.broadcast('message');
      expect(notificationCenter.message).toEqual('message');
    });
  });
});
