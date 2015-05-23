class MeetupPostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :meetup_member?, only: [:create, :edit, :update, :destroy]
  respond_to :json

  def index
    @meetup = Meetup.find(params[:meetup_id])
    @meetup_posts = @meetup.meetup_posts.all
    respond_to do |format|
      format.html{}
      format.js {}
      format.json{render json: @meetup_posts}
    end

  end

  def feed
  end

  def show
    @meetup_post = MeetupPost.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js { render 'update'}
      format.json { render json: @meetup_post }
    end
  end

  def new
    @meetup_post = MeetupPost.new
  end

  def edit
    @meetup_post = MeetupPost.find(params[:id])
    respond_to do |format|
      format.html{}
      format.js {}
    end
  end

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @meetup_post = @meetup.meetup_posts.build(meetup_post_params)
    @meetup_post.user_id = current_user.id

    respond_to do |format|
      if @meetup_post.save
        format.html { redirect_to @meetup }
        format.json { render json: @meetup_post, status: :created }
        format.js {}
      else
        format.json { render json: @meetup_post.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def update
    @meetup_post = MeetupPost.find(params[:id])
    respond_to do |format|
      if @meetup_post.update(meetup_post_params)
        format.js {}
        format.html { redirect_to @meetup_post.meetup }
        format.json { render json: @meetup_post, status: :ok, location: @meetup_post }
      else
        format.json { render json: @meetup_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meetup_post = MeetupPost.find(params[:id])
    respond_to do |format|
      if @meetup_post.destroy
        format.html { redirect_to @meetup_post.meetup }
        format.json { render json: @meetup_post, status: :created }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @meetup_post.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  private
    def meetup_post_params
      params.require(:meetup_post).permit(:description, :title)
    end
end
