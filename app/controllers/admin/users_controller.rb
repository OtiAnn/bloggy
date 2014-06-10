class Admin::UsersController < ApplicationController
  before_action :set_user

  def destroy
    @user.destroy!
    respond_to do |format|
      format.html { redirect_to "/" , notice: '帳號刪除成功！' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
