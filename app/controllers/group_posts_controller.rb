class GroupPostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def index
    @group = Group.find(params[:group_id])
    @group_posts = @group.group_posts.all
    respond_to do |format|
      format.html{}
      format.js {}
      format.json{render json: @group_posts}
    end

  end

  def feed
  end

  def show
    @group_post = GroupPost.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js { render 'update'}
      format.json { render json: @group_post }
    end
  end

  def new
    @group_post = GroupPost.new
  end

  def edit
    @group_post = GroupPost.find(params[:id])
    respond_to do |format|
      format.html{}
      format.js {}
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @group_post = @group.group_posts.build(group_post_params)
    @group_post.user_id = current_user.id

    respond_to do |format|
      if @group_post.save
        format.html { redirect_to @group }
        format.json { render json: @group_post, status: :created }
        format.js {}
      else
        format.json { render json: @group_post.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def update
    @group_post = GroupPost.find(params[:id])
    respond_to do |format|
      if @group_post.update(group_post_params)
        format.js {}
        format.html { redirect_to @group_post.Group }
        format.json { render json: @group_post, status: :ok, location: @group_post }
      else
        format.json { render json: @group_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group_post = GroupPost.find(params[:id])
    respond_to do |format|
      if @group_post.destroy
        format.html { redirect_to @group_post.group }
        format.json { render json: @group_post, status: :created }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @group_post.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  private
    def group_post_params
      params.require(:group_post).permit(:description, :title)
    end
end
