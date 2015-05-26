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

#------------------------------------------------------------------


 def user_list
    @exist = Follow.select('following_id').where(:user_id => current_user.id, :status => true)
    @users = User.select('id,user_name').all
 end
 def subscribe_user
  @exist = Follow.select('id, status').where(:following_id => params[:id], :user_id => current_user.id).first
  if @exist
  if @exist.status == true
      Follow.where(id: @exist.id).update_all(status: false)
    else
     Follow.where(id: @exist.id).update_all(status: true)
  end
     redirect_to welcome_path
   else
     @follow = Follow.new
       @follow.following_id = params[:id]
        @follow.user_id = current_user.id
         @follow.status = true
           @follow.save
       redirect_to welcome_path
  end
 end









#------------------------------------------------------------------------------------------

  def _following
     @user = User.find_by_username(params[:username])
     @users = User.find_by_username(params[:username]).all_following
  end

def _followers
   @user = User.find_by_username(params[:username])
   @users = User.find_by_username(params[:username]).followers
end

    def follow
      @user = User.find(params[:id])

      if current_user
        if current_user == @user
          flash[:error] = "You cannot follow yourself."
        else
          current_user.follow(@user)
          RecommenderMailer.new_follower(@user).deliver if @user.notify_new_follower
         format.html {notice:"You are now following #{@user.full_name}."}
         redirect_to profileshow(@user)
        end
      else
        flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow #{@user.monniker}.".html_safe
      end
    end

    def unfollow
      @user = User.find(params[:id])

      if current_user
        current_user.stop_following(@user)
        flash[:notice] = "You are no longer following #{@user.full_name}."
        redirect_to root_path
      else
        flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.monniker}.".html_safe
      end


    end
#-----------------------------------------------------------------------------
end
