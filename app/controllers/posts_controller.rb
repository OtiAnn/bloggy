class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  after_action :increment_counter, only: [:show]

  def index
    @users = User.all
    @posts = Post.paginate(:page => params[:page], :per_page => 4).order("created_at DESC")
    @posts = @q.result.paginate(:page => params[:page], :per_page => 4).order("created_at DESC")
  end

  def show
    @comment = @post.comments.build
    @post = Post.find(params[:id])
    Post.increment_counter(:posts_count, @post.id)
    @user = User.all
    @rd = RDiscount.new(@post.body, :no_superscript).to_html
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @post = Post.new
    @category = Category.all
  end

  def edit
    @user = current_user
    @post = @user.posts.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.set_user!(current_user)

    respond_to do |format|
      if @post.save
        # Post.increment_counter(:posts_count, @post.id)
        format.html { redirect_to @post, notice: '文章儲存成功！' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.all
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '文章更新成功！' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: '文章刪除成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :picture, :user_id, :category_id)
    end
    def increment_counter
      @post.posts_count += 1 if @post.present?
    end
end
