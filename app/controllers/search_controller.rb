class SearchController < ApplicationController
  def index
    if params[:query].start_with?('#')
      query = params[:query].gsub(/[#]/,'')
      # @posts = Post.joins(:hash_tag).where(hash_tags: {name: query})
      @posts = Post.where("description like ?", "%#{params[:query]}%")
    else 
      @posts = Post.where("description like ?", "%#{params[:query]}%")
    end
  end
end
