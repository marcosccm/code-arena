describe('NotficiationCenter', function(){
  var rootScope, notificationCenter;

  beforeEach(function(){
    rootScope = {
      $broadcast: function(){}
    };
    notificationCenter = NotificationCenter(rootScope);
  });

  it('starts with a blank message', function(){
    expect(notificationCenter.message).toEqual('');
  });

  describe('when broadcasting messages', function(){
    it('send messages through the rootScope', function(){
      spyOn(rootScope, '$broadcast');
      notificationCenter.broadcast('something happened');
      expect(rootScope.$broadcast).toHaveBeenCalledWith('notification:received');
    });

    it('changes the service message', function(){
      notificationCenter.broadcast('message');
      expect(notificationCenter.message).toEqual('message');
    });
  });
});
