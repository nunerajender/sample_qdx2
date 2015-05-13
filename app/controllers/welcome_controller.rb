class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      #current_user.id
      @user_id = current_user.id
      @post = Post.where(:user_id => @user_id ).last
      @comment = Comment.where(:post_id => @post.id)

      p @comment
      p '----------------------'
    else
      @post = Post.last
       @comment = Comment.where(:post_id => @post.id)

    end
    #p @post
  end
end
