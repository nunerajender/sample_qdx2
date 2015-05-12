class WelcomeController < ApplicationController
  def index
    @post = Post.last
    p @post
  end
end
