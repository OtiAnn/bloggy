class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :all_categories
  helper_method :all_posts
  helper_method :all_comments
  # before_action :authenticate_user!
  def all_categories
  	@categories = Category.all
  end
  
  def all_posts
  	@posts = Post.all
  end

  def all_comments
    @comments = Comment.all
  end
end
