class StudyMeetupsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :json, :html

  def index
    @study_meetups = StudyMeetup.all
    respond_to do |format|
      format.html { }
      format.js {}
      format.json { render json: @study_meetups, location: @study_meetups }
    end
  end

  def show
    @study_meetup = StudyMeetup.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.js {}
      format.json { render json: @study_meetup, location: @study_meetup }
    end
  end

  def edit
    @study_meetup = StudyMeetup.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.js {}
      format.json { render json: @study_meetup, location: @study_meetup }
    end
  end

  def new
    @study_meetup = StudyMeetup.new
  end

  def create
    @study_meetup = StudyMeetup.new(study_meetup_params)
    @study_meetup.user_id = current_user.id
    respond_to do |format|
      if @study_meetup.save
        format.html { redirect_to @study_meetup, notice: 'study meetup was successfully created.' }
        format.js {}
        format.json { render @study_meetup, status: :created, location: @study_meetup }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @study_meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @study_meetup.update(study_meetup_params)
        format.html { redirect_to @study_meetup, notice: 'study meetup was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_meetup }
      else
        format.html { render :edit }
        format.json { render json: @study_meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @study_meetup = StudyMeetup.find(params[:id])
    @study_meetup.destroy
    respond_to do |format|
      format.html { redirect_to study_meetups_url, notice: 'study meetup was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    def study_meetup_params
      params.require(:study_meetup).permit(:name, :organization)
    end
end


