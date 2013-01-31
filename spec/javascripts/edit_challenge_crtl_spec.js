describe('EditChallengeCrtl', function(){
  var scope, challengeApi, notificationCenter, challenge, location;

  beforeEach(inject(function($controller) {
    scope = {};
    challenge = 'challenge'
    challengeApi = { 
      query: jasmine.createSpy().andReturn(challenge),
      update: jasmine.createSpy().andCallFake(function(e,cb) { cb({}) })
    };
    notificationCenter = jasmine.createSpyObj('notifications', ['broadcast']);
    location           = jasmine.createSpyObj('location', ['path']); 
    editor             = jasmine.createSpyObj('editor', ['on', 'setMode']);
    editor.init        = jasmine.createSpy().andReturn(editor);

    crtl  = $controller(EditChallengeCrtl, {
      $scope: scope, 
      challengeApi: challengeApi, 
      notificationCenter: notificationCenter, 
      $location: location,
      editor: editor
    });
  }));

  it('initializes the editor', function() {
    expect(editor.init).toHaveBeenCalledWith('editor');
  });

  it('sets the editor to markdown', function() {
    expect(editor.setMode).toHaveBeenCalledWith('markdown');
  });

  it('instatiate challenge from api response', function(){
    expect(scope.challenge).toEqual(challenge);
  });

  describe('editing current challenge', function(){
    it('updates the challenge', function(){
      scope.edit();
      expect(challengeApi.update).toHaveBeenCalled();
    });

    it('broadcasts server response message', function(){
      scope.edit();
      expect(notificationCenter.broadcast).toHaveBeenCalled();
    });

    it('redirects to the index page', function(){
      scope.edit();
      expect(location.path).toHaveBeenCalledWith('/');
    });
  });

  describe('canceling edit action', function(){
    it('redirects to the index page', function(){
      scope.cancel();
      expect(location.path).toHaveBeenCalledWith('/');
    });
  });
});
