class HomeController < ApplicationController

  def index
    @post = Post.last

    @volunteer = Volunteer.last
  end
end
