class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  after_filter :store_location

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :site_search

  protected

  def sign_in_page?
    request.fullpath =~ /users/
  end

  def store_location
    return if sign_in_page?
    session[:previous_url] = request.fullpath
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
  #讓登入畫面回到前一頁

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name
  end
  #讓註冊時的名字可以被存取下來

  protect_from_forgery with: :exception
  helper_method :all_categories
  helper_method :all_posts
  helper_method :all_comments

  def all_categories
  	@categories = Category.all
  end

  def all_posts
    @posts = Post.all
  end

  def all_comments
    @comments = Comment.all
  end

  def all_users
    @users = User.all
  end

  def site_search
    @q = Post.search(params[:q])
    @search_posts = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 4)
  end

end