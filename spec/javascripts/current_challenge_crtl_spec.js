describe('CurrentChallengeCrtl', function(){
  var scope, challengeApi, challenge;

  beforeEach(function() {
    scope = {};
    challengeApi = { query: function(){}, };
    challenge = 'challenge'
  });

  it('instatiate challenge from api response', function(){
    spyOn(challengeApi, 'query').andReturn(challenge)
    crtl  = new CurrentChallengeCrtl(scope, challengeApi);
    expect(scope.challenge).toEqual(challenge);
  });
});
