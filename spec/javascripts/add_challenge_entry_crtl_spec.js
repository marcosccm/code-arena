describe('AddChallengeEntryCrtl', function(){
  var scope, entriesApi, notifications, location;

  beforeEach(inject(function($controller) {
    scope = {};
    entriesApi = {};

    notifications    = jasmine.createSpyObj('notifications', ['broadcast']);
    location         = jasmine.createSpyObj('location', ['path']); 
    editor           = jasmine.createSpyObj('editor', ['on', 'setMode']);
    entriesApi.save  = jasmine.createSpy().andCallFake(function(i, cb) { cb({}) });

    $controller(AddChallengeEntryCrtl, {
      $scope: scope, 
      entryApi: entriesApi, 
      notificationCenter: notifications, 
      $location: location, 
      editor: editor
    });
  }));

  describe('adding a challenge entry', function(){
    it('saves the entry', function(){
      scope.submit();
      expect(entriesApi.save).toHaveBeenCalled();
    });

    it('broadcasts server response message', function(){
      scope.submit();
      expect(notifications.broadcast).toHaveBeenCalled();
    });

    it('redirects to the index page', function(){
      scope.submit();
      expect(location.path).toHaveBeenCalledWith('/');
    });
  });

  describe('canceling the add action', function(){
    it('redirects to the index page', function(){
      scope.cancel();
      expect(location.path).toHaveBeenCalledWith('/');
    });
  });

  describe('changing the selected editor language', function(){
    it('sends the change to the editor', function(){
      scope.entry.language = 'ruby'
      scope.changeLanguage();
      expect(editor.setMode).toHaveBeenCalledWith('ruby');
    });
  });
});
