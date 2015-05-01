class UserPostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    @user_posts = UserPost.all

    render json: @user_posts
  end

  def feed
  end

  def show
    @user_post = UserPost.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js {}
      format.json { render json: @user_post }
    end

  end

  def new
    @user_post = UserPost.new
  end

  def edit
    @user_post = UserPost.find(params[:id])
    respond_to do |format|
      format.html{}
      format.js {}
    end
  end

  def create
    @user_post = current_user.user_posts.build(user_post_params)

    respond_to do |format|
      if @user_post.save
        format.html { redirect_to feed_url }
        format.json { render json: @user_post, status: :created }
        format.js {}
      else
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def update
    @user_post = UserPost.find(params[:id])
    respond_to do |format|
      if @user_post.update(user_post_params)
        format.js {}
        format.html { redirect_to feed_url }
        format.json { render json: @user_post, status: :ok, location: @user_post }
      else
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_post = UserPost.find(params[:id])
    respond_to do |format|
      if @user_post.destroy
        format.html { redirect_to feed_path }
        format.json { render json: @user_post, status: :created }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  private
    def user_post_params
      params.require(:user_post).permit(:description)
    end
end
