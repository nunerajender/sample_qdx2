class PostsController < ApplicationController
require "prawn"
 #before_filter :authenticate_user!, :except => [:show, :index]
 before_filter :authenticate_user!, :except => [:show, :index]



    def index
# @post = Post.all
        @post = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 3)

#format.pdf do
      #send_data PostDrawer.draw(@posts), :filename => 'posts.pdf', :type => 'application/pdf', :disposition => 'inline'
    #end

    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end
    def edit
        @post = Post.find(params[:id])
    end

    def create

        #@post = Post.new(params[:post])
        #@post = Post.new(params.require(:post).permit(:title, :text))

        @post = Post.new(post_params) #adding strong parameters method name here
        #@comment = @post.comments.create(comment_params)
        @post.user_id = current_user.id

        if @post.save
            ExampleMailer.sample_email(@post).deliver_now
        redirect_to @post
        else
            render 'new'
        end
    end
        #render plain: params[:post].inspect
        #render plain: params[:post].inspect

    def update

        @post =Post.find(params[:id])
        if @post.update(post_params)
        redirect_to @post
        else
             render 'edit'
        end
    end

            # in RESTful CRUD its D

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to @post
    end
  def download_pdf
    post = Post.find(params[:id])
    send_data generate_pdf(post),
              filename: "#{post.title}.pdf",
              type: "application/pdf"
  end

  def import
    if (params[:file])

    Post.import(params[:file])
    redirect_to root_url, notice: "Posts imported."
    else
    redirect_to posts_path, notice: " No file selected."
    end
  end



    private

  def generate_pdf(post)
    Prawn::Document.new do
      text post.title, align: :center
      text "Text: #{post.text}"

    end.render
  end

    def post_params
        params.require(:post).permit(:title, :text)  # this is for  strong parameters
    end

    #def comment_params
       # params.require(:comment).permit(:commenter, :body)
    #end

end
