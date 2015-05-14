class WelcomeController < ApplicationController
  def index
    @users = User.all
    if user_signed_in?
      #current_user.id
      @user_id = current_user.id

      @post = Post.where(:user_id => @user_id ).last
      if @post
      @comment = Comment.where(:post_id => @post.id)
      end
      p @comment
      p '----------------------'
    else
      @post = Post.last
       @comment = Comment.where(:post_id => @post.id)

    end
    #p @post
  end
end
