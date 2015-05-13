class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      #current_user.id
      @user_id = current_user.id
      @post = Post.where(:user_id => @user_id ).last
      p @post
    else

    @post = Post.last
    end
    #p @post
  end
end
