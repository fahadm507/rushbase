class CurrentCoursesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json, :html
  # GET /current_courses
  # GET /current_courses.json
  def index
    @current_courses = CurrentCourse.all
    render json: @current_courses
  end

  def show
  end

  # GET /current_courses/new
  def new
    @current_course = CurrentCourse.new
  end

  def create
    @user = User.find(params[:user_id])
    @current_course = CurrentCourse.new(current_course_params)
    @current_course.user_id = @user.id

    respond_to do |format|
      if @current_course.save
        format.html { redirect_to @current_course, notice: 'Current course was successfully created.' }
        format.js {}
        format.json { render :@current_course, status: :created, location: @current_course }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @current_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @current_course.update(current_course_params)
        format.html { redirect_to @current_course, notice: 'Current course was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_course }
      else
        format.html { render :edit }
        format.json { render json: @current_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @current_course = CurrentCourse.find(params[:id])
    respond_to do |format|
      if @current_course.destroy
        format.html { redirect_to current_courses_url, notice: 'Current course was successfully destroyed.' }
        format.js {}
        format.json { render json: @current_course }
      else
        format.html { redirect_to current_courses_url, notice: 'Current course was successfully destroyed.' }
        format.js {}
        format.json { render json: @current_course }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def current_course_params
      params.require(:current_course).permit(:name, :organization)
    end
end
