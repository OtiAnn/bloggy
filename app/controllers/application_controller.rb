class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name
  end
  #讓註冊時的名字可以被存取下來


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