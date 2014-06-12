class PagesController < ApplicationController

  def about
  	@users = User.all
  end

  def toppost
    @posts = Post.paginate(:page => params[:page], :per_page => 4)
                 .order("posts_count DESC")
  end

  def admin
    @user_posts = Post.where(:user_id => current_user.id).order("created_at DESC")
  end

end
