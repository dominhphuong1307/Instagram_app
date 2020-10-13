class HomeController < ApplicationController
  def index
    @users = User.find_by(params[:user_id])
    @posts = Post.order(created_at: :desc)
    @post = Post.all
  end
end
