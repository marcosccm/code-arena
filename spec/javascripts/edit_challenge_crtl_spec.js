describe('EditChallengeCrtl', function(){
  var scope, challengeApi, notificationCenter, challenge, location;

  beforeEach(function() {
    scope = {};
    notificationCenter = { broadcast: function(){} };
    challengeApi = { 
      query: function(){}, 
      update: function(e,cb) { cb({}); }  
    };
    location = {
      path: function(){}
    }
    challenge = 'challenge'
    crtl  = new EditChallengeCrtl(scope, challengeApi, notificationCenter, location);
  })

  it('instatiate challenge from api response', function(){
    spyOn(challengeApi, 'query').andReturn(challenge)
    crtl  = new EditChallengeCrtl(scope, challengeApi, notificationCenter);
    expect(scope.challenge).toEqual(challenge);
  });

  describe('editing current challenge', function(){
    it('updates the challenge', function(){
      spyOn(challengeApi, 'update')
      scope.edit();
      expect(challengeApi.update).toHaveBeenCalled();
    });

    it('broadcasts server response message', function(){
      spyOn(notificationCenter, 'broadcast')
      scope.edit();
      expect(notificationCenter.broadcast).toHaveBeenCalled();
    });

    it('redirects to the index page', function(){
      spyOn(location, 'path')
      scope.edit();
      expect(location.path).toHaveBeenCalledWith('/');
    });
  });

  describe('canceling edit action', function(){
    it('redirects to the index page', function(){
      spyOn(location, 'path')
      scope.cancel();
      expect(location.path).toHaveBeenCalledWith('/');
    });
  });
});
