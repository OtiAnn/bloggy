class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def admin
    @user_posts = Post.where(:user_id => current_user.id)
  end
end
