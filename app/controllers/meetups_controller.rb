class MeetupsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :json, :html

  def index
    @meetups = Meetup.all
    respond_to do |format|
      format.html { }
      format.js {}
      format.json { render json: @meetups, location: @meetups }
    end
  end

  def show
    @new_post = MeetupPost.new
    @meetup = Meetup.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.js {}
      format.json { render json: @meetup, location: @meetup }
    end
  end

  def edit
    @meetup = Meetup.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.js {}
      format.json { render json: @meetup, location: @meetup }
    end
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user_id = current_user.id
    respond_to do |format|
      if @meetup.save
        format.html { redirect_to @meetup, notice: 'study meetup was successfully created.' }
        format.js {}
        format.json { render @meetup, status: :created, location: @meetup }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meetup.update(meetup_params)
        format.html { redirect_to @meetup, notice: 'study meetup was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetup }
      else
        format.html { render :edit }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy
    respond_to do |format|
      format.html { redirect_to meetups_url, notice: 'study meetup was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    def meetup_params
      params.require(:meetup).permit(:name, :organization)
    end
end


