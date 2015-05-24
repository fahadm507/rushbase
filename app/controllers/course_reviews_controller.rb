class CourseReviewsController < ApplicationController
  before_action :set_course_review, only: [:show, :edit, :update, :destroy]
def index
    @course = CourseReview.find(params[:course_id])
    @course_reviews = @course.course_reviews.all
    respond_to do |format|
      format.html{}
      format.js {}
      format.json{render json: @course_reviews}
    end

  end

  def feed
  end

  def show
    @course_review = CourseReview.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js { render 'update'}
      format.json { render json: @course_review }
    end
  end

  def new
    @course = Course.find(params[:course_id])
    @course_review = CourseReview.new
  end

  def edit
    @course_review = CourseReview.find(params[:id])
    respond_to do |format|
      format.html{}
      format.js {}
    end
  end

  def create
    @course = Course.find(params[:course_id])
    @course_review = @course.course_reviews.build(course_review_params)
    @course_review.user_id = current_user.id

    respond_to do |format|
      if @course_review.save
        format.html { redirect_to @course }
        format.json { render json: @course_review, status: :created }
        format.js {}
      else
        format.json { render json: @course_review.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def update
    @course_review = CourseReview.find(params[:id])
    respond_to do |format|
      if @course_review.update(course_review_params)
        format.js {}
        format.html { redirect_to @course_review.course }
        format.json { render json: @course_review, status: :ok, location: @course_review }
      else
        format.json { render json: @course_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course_review = CourseReview.find(params[:id])
    respond_to do |format|
      if @course_review.destroy
        format.html { redirect_to @course_review.course }
        format.json { render json: @course_review, status: :created }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @course_review.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  private
    def course_review_params
      params.require(:course_review).permit(:description, :title)
    end
end
