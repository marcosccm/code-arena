describe('CurrentChallenge', function(){
  var scope, challengeApi, notificationCenter, challenge;

  beforeEach(function() {
    scope = {};
    notificationCenter = { broadcast: function(){} };
    challengeApi = { query: function(){}, };
    challenge = 'challenge'
    crtl  = new CurrentChallengeCrtl(scope, challengeApi, notificationCenter);
  });

  it('instatiate challenge from api response', function(){
    spyOn(challengeApi, 'query').andReturn(challenge)
    crtl  = new CurrentChallengeCrtl(scope, challengeApi, notificationCenter);
    expect(scope.challenge).toEqual(challenge);
  });
})
