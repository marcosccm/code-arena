describe('CurrentChallengeCrtl', function(){
  var scope, challengeApi;

  beforeEach(inject(function($controller) {
    scope = {};
    challengeApi = { query: function(){}, };
    spyOn(challengeApi, 'query').andReturn('challenge')

    $controller(CurrentChallengeCrtl, { $scope: scope, challengeApi: challengeApi });
  }));

  it('instatiate challenge from api response', function(){
    expect(scope.challenge).toEqual('challenge');
  });
});
