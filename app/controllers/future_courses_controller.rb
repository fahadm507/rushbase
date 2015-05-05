class FutureCoursesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :json, :html
  def index
    @future_courses = FutureCourse.all
    render json: @future_courses
  end

  def show
    @future_course = set_future_course
    render json: @future_course
  end

  def create
    @future_course = FutureCourse.new(future_course_params)
    @future_course.user_id = current_user.id
    respond_to do |format|
      if @future_course.save
        format.html { redirect_to @future_course, notice: 'Taken course was successfully created.' }
        format.js {}
        format.json { render @take_course, status: :created, location: @future_course }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @future_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @future_course.update(future_course_params)
        format.html { redirect_to @future_course, notice: 'Taken course was successfully updated.' }
        format.json { render :show, status: :ok, location: @future_course }
      else
        format.html { render :edit }
        format.json { render json: @future_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @future_course = FutureCourse.find(params[:id])
    @future_course.destroy
    respond_to do |format|
      format.html { redirect_to future_courses_url, notice: 'Taken course was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    def future_course_params
      params.require(:future_course).permit(:name, :organization)
    end
end
