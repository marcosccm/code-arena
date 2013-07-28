describe('PreviousChallengesCrtl', function(){
  var scope, challengeApi, challenges;

  beforeEach(inject(function($controller) {
    scope = {};
    previousApi = { query: function(){}, };

    challenges = ['challenge1', 'challenge2']
    spyOn(previousApi, 'query').andReturn(challenges)
    $controller(PreviousChallengesCrtl, { $scope: scope, previousApi: previousApi });
  }));

  it('retrieves previous challenges from the server', function(){
    expect(scope.challenges).toEqual(challenges);
  });
});
