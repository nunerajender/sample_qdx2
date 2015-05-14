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
             # p @comment
             #  p '----------------------'
          else
               @post = Post.last
               @comment = Comment.where(:post_id => @post.id)

          end
            #p @post
  end

def user_list
@exist = Follow.select('following_id').where(:user_id => current_user.id, :status => true)
@users = User.all
end
def subscribe_user
@exist = Follow.select('id, status').where(:following_id => params[:id], :user_id => current_user.id).first
if @exist
if @exist.status == true
Follow.where(id: @exist.id).update_all(status: false)
else
Follow.where(id: @exist.id).update_all(status: true)
end
redirect_to welcomes_path
else
@follow = Follow.new
@follow.following_id = params[:id]
@follow.user_id = current_user.id
@follow.status = true
@follow.save
redirect_to welcomes_path
end
end

end
