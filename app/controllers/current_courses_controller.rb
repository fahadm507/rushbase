class CurrentCoursesController < ApplicationController
  before_action :set_current_course, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html
  # GET /current_courses
  # GET /current_courses.json
  def index
    @current_courses = CurrentCourse.all
    render json: @current_courses
  end

  # GET /current_courses/1
  # GET /current_courses/1.json
  def show
  end

  # GET /current_courses/new
  def new
    @current_course = CurrentCourse.new
  end

  # GET /current_courses/1/edit
  def edit
  end

  # POST /current_courses
  # POST /current_courses.json
  def create
    @current_course = CurrentCourse.new(current_course_params)

    respond_to do |format|
      if @current_course.save
        format.html { redirect_to @current_course, notice: 'Current course was successfully created.' }
        format.json { render :show, status: :created, location: @current_course }
      else
        format.html { render :new }
        format.json { render json: @current_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /current_courses/1
  # PATCH/PUT /current_courses/1.json
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

  # DELETE /current_courses/1
  # DELETE /current_courses/1.json
  def destroy
    @current_course.destroy
    respond_to do |format|
      format.html { redirect_to current_courses_url, notice: 'Current course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_course
      @current_course = CurrentCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def current_course_params
      params[:current_course]
    end
end
