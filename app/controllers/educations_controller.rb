class EducationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def index
    @educations = Education.all
  end

  def show
    @education = Education.find(params[:id])
  end

  def new
    @education = Education.new
  end

  def edit
    @education = Education.find(params[:id])
  end

  def create
    @education = Education.new(education_params)
    @education.user_id = current_user.id

    respond_to do |format|
      if @education.save
        format.html { redirect_to @education, notice: 'Education was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @education }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @education = Education.find(params[:id])
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.js {}
        format.json { render :show, status: :ok, location: @education }
      else
        format.html { render :edit }
        format.js {}
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_url, notice: 'Education was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private

    def education_params
      params.require(:education).permit(:degree, :organization,:key_courses, :year, :graduated)
    end
end
