class PagesController < ApplicationController
  # before_action :admin?, only: [:admin]

  def about
  	@users = User.all
  end

  def contact
  end

  def admin
    @user_posts = Post.where(:user_id => current_user.id)
  end

  private

  	# def admin?
   #  	redirect_to posts_path, notice: 'Unauthorized.' unless current_user.admin?
  	# end
end
