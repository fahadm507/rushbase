class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:create,:update, :destroy]

  def index
    @courses = Course.paginate(page: params[:page], per_page: 50)
    respond_to do |format|
      format.html {}
      format.json { render json: @courses }
    end
  end

  def show
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @course }
    end
  end

  def create
    @organization = Organization.find(params[:organization_id])
    instructor = Instructor.find_by(id: current_user.id)
    if instructor.present?
      @course = instructor.courses.build(course_params)
      @course.organization_id = @organization.id

      respond_to do |format|
        if @course.save
          format.html { redirect_to course_path(@course)}
          format.json { render json: @course, status: :created }
        else
          format.html { render :new}
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update(@course)
        format.json { render :show, status: :ok, location: @course }
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])

    respond_to do |format|
      if  @course.destroy
        format.json { render json: @course }
      else
        format.json { render json: @course.errors }
      end
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :organization_id, :instructor_id)
  end
end
