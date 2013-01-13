describe('AddChallengeEntryCrtl', function(){
  var scope, entriesApi, notifications, location;

  beforeEach(function() {
    scope = {};
    notifications = { broadcast: function(){} };
    entriesApi = { save: function(e,cb) { cb({}); }  };
    location = { path: function(){} };
    editor = { on: function() {} };

    new AddChallengeEntryCrtl(scope, entriesApi, notifications, location, editor);
  });

  describe('adding a challenge entry', function(){
    it('saves the entry', function(){
      spyOn(entriesApi, 'save')
      scope.submit();
      expect(entriesApi.save).toHaveBeenCalled();
    });

    it('broadcasts server response message', function(){
      spyOn(notifications, 'broadcast')
      scope.submit();
      expect(notifications.broadcast).toHaveBeenCalled();
    });

    it('redirects to the index page', function(){
      spyOn(location, 'path')
      scope.submit();
      expect(location.path).toHaveBeenCalledWith('/');
    });
  });

  describe('canceling the add action', function(){
    it('redirects to the index page', function(){
      spyOn(location, 'path')
      scope.cancel();
      expect(location.path).toHaveBeenCalledWith('/');
    });
  });
});
