class PostsController < ApplicationController
    def new
    end
    def create
         @post = Post.new(post_params)
         if @post.save 
             flash[:success] = "Successfully saved"
             redirect_to root_path
         else 
            flash[:danger] = "Save failed"
            redirect_to new_post_path
         end
    end

    def show
         @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy 

        redirect_to user_path(current_user)
    end

    def edit
        @post = Post.find(params[:id])
    end
    def update
        
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:success] = "Successfully updated!"
            redirect_to post_path(@post)
        else 
            flash[:danger] = "Update failed!"
            redirect_to edit_post_path
        end
    end
    private

    def post_params
        params.require(:post).permit(:description,:image,:user_id)
    end
end
