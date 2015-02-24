class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    @organization = Organization.find(params[:organization_id])
  end

  def edit
  end

  def create
    binding.pry
    @organization = Organization.find(params[:organization_id])
    instructor = get_instructor
    if instructor.present?
      @course = instructor.courses.build(course_params)
      @course.organization_id = @organization.id

      respond_to do |format|
        if @course.save
          format.html { redirect_to organization_courses_path(@organization), notice: 'Course was successfully created.' }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def get_instructor
    Instructor.find_by(id: current_user.id)
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:name, :description, :organization_id, :instructor_id)
  end
end
