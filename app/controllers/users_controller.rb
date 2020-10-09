class UsersController < ApplicationController
    # protect_from_forgery prepend: true
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @posts = current_user.posts.order(created_at: :desc)
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
         @user = User.find(params[:id])
         if @user.update(user_params)
            flash[:alert] = "Successfully update"
            redirect_to user_path(@user)
         else
            flash[:danger] = "Update Fails"
            redirect_to edit_user_path
         end
    end

   

    private 

    def user_params
        params.require(:user).permit(:username,:email,:phone,:gender,:bio,:name,:website,:avatar)
    end
end
