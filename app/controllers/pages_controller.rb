class PagesController < ApplicationController

  def about
  	@users = User.all
  end

  def contact
  end

  def admin
    @user_posts = Post.where(:user_id => current_user.id)
  end

end
