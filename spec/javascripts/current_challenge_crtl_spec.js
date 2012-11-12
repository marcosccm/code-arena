describe('CurrentChallenge', function(){
  var scope, challengeApi, notificationCenter, challenge;

  beforeEach(function() {
    scope = {};
    notificationCenter = { broadcast: function(){} };
    challengeApi = { 
      query: function(){}, 
      update: function(e,cb) { cb({}); }  
    };
    challenge = 'challenge'
    crtl  = new CurrentChallengeCrtl(scope, challengeApi, notificationCenter);
  });

  it('instatiate challenge from api response', function(){
    spyOn(challengeApi, 'query').andReturn(challenge)
    crtl  = new CurrentChallengeCrtl(scope, challengeApi, notificationCenter);
    expect(scope.challenge).toEqual(challenge);
  });

  describe('editing current challenge', function(){
    it('updates the challenge', function(){
      spyOn(challengeApi, 'update')
      scope.edit();
      expect(challengeApi.update).toHaveBeenCalled();
    });

    it('reloads the challenge content', function(){
      spyOn(challengeApi, 'query').andReturn('new challenge')
      scope.edit();
      expect(scope.challenge).toEqual('new challenge');
    });

    it('broadcasts server response message', function(){
      spyOn(notificationCenter, 'broadcast')
      scope.edit();
      expect(notificationCenter.broadcast).toHaveBeenCalled();
    });
  });
});
