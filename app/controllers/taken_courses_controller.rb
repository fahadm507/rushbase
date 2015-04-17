class TakenCoursesController < ApplicationController
  before_action :set_taken_course, only: [:show, :edit, :update, :destroy]
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

    respond_to do |format|
      if @taken_course.save
        format.html { redirect_to @taken_course, notice: 'Taken course was successfully created.' }
        format.json { render @take_course, status: :created, location: @taken_course }
      else
        format.html { render :new }
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
    @taken_course.destroy
    respond_to do |format|
      format.html { redirect_to taken_courses_url, notice: 'Taken course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taken_course
      @taken_course = TakenCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taken_course_params
      params[:taken_course]
    end
end
