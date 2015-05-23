class CourseReviewsController < ApplicationController
  before_action :set_course_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @course_reviews = CourseReview.all
    respond_with(@course_reviews)
  end

  def show
    respond_with(@course_review)
  end

  def new
    @course_review = CourseReview.new
    respond_with(@course_review)
  end

  def edit
  end

  def create
    @course_review = CourseReview.new(course_review_params)
    @course_review.save
    respond_with(@course_review)
  end

  def update
    @course_review.update(course_review_params)
    respond_with(@course_review)
  end

  def destroy
    @course_review.destroy
    respond_with(@course_review)
  end

  private
    def set_course_review
      @course_review = CourseReview.find(params[:id])
    end

    def course_review_params
      params.require(:course_review).permit(:title, :description, :user_id, :course_id)
    end
end
