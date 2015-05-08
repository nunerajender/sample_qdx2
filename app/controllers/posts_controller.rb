class PostsController < ApplicationController

    def index
        @post = Post.all
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
        if @post.save
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


    private

    def post_params
        params.require(:post).permit(:title, :text)  # this is for  strong parameters
    end

    #def comment_params
       # params.require(:comment).permit(:commenter, :body)
   # end

end
