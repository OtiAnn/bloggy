class UsersController < ApplicationController

  before_action :set_user

  def index
    @user = User.all
  end

  def show
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 4)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
