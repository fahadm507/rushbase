class TakenCoursesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :json, :html
  def index
    @taken_courses = TakenCourse.all
    render json: @taken_courses
  end

  def show
    @taken_course = set_taken_course
    render json: @taken_course
  end

  def create
    @taken_course = TakenCourse.new(taken_course_params)
    @taken_course.user_id = current_user.id
    respond_to do |format|
      if @taken_course.save
        format.html { redirect_to @taken_course, notice: 'Taken course was successfully created.' }
        format.js {}
        format.json { render @take_course, status: :created, location: @taken_course }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @taken_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @taken_course.update(taken_course_params)
        format.html { redirect_to @taken_course, notice: 'Taken course was successfully updated.' }
        format.json { render :show, status: :ok, location: @taken_course }
      else
        format.html { render :edit }
        format.json { render json: @taken_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @taken_course = TakenCourse.find(params[:id])
    @taken_course.destroy
    respond_to do |format|
      format.html { redirect_to taken_courses_url, notice: 'Taken course was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    def taken_course_params
      params.require(:taken_course).permit(:name, :organization)
    end
end
