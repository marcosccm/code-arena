class HomeController < ApplicationController
  def index
    @challenge = CurrentChallenge.current
  end
end
