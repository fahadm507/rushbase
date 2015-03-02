class UserPostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  respond_to :json, :html

  # GET /user_posts
  # GET /user_posts.json
  def index
    @user_posts = UserPost.all
    respond_to do |format|
      format.html { @user_posts }
      format.json { render json: @user_posts }
    end
  end

  def feed
    @user_posts = UserPost.all
  end

  def show
    binding.pry
    @user_post = UserPost.find(params[:id])
    respond_to do |format|
      format.json { render json: [@user_post, current_user] }
    end
  end

  def create
    @user_post = current_user.user_posts.build(user_post_params)

    respond_to do |format|
      if @user_post.save
        format.html { redirect_to feed_path, notice: 'User post was successfully created.' }
        format.json { render json: @user_post, status: :created, location: @user_post }
      else
        format.html { render :new }
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_post.update(user_post_params)
        format.html { redirect_to feed_path, notice: 'User post was successfully updated.' }
        format.json { render json: @user_post, status: :ok, location: @user_post }
      else
        format.html { render :edit }
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_post = prams[:user_post_id]
    respond_to do |format|
      if @user_post.destroy
        format.html { redirect_to user_posts_url, notice: 'User post was successfully destroyed.' }
        format.json { render json: @user_post }
      else
        format.html { redirect_to user_posts_url }
        format.json { render json: @user_post.errors }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_post_params
      params.require(:user_post).permit(:description)
    end
end
