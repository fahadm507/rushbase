class SchoolsController < ApplicationController
  before_action :authenticate_user!,  only: [:create,:update,:new,:destroy]
  respond_to :json

  def index
    @schools = School.all
    respond_to do |format|
      format.html {}
      format.json { render json: @school, status: :created, location: @school }
      format.js {}
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(params_school)
    @school.user_id = current_user.id

    respond_to do |format|
      if @school.save
        format.html { redirect_to schools_path,  notice: "school was created"}
        format.json { render json: @school, status: :created, location: @school }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def update
    respond_to do |format|
      @school = School.find(params[:school_id])
      if @school.update(school_params)
        format.json { render json: @school, status: :ok, location: @school }
      else
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school = School.find(params[:id])
    respond_to do |format|
      if @school.destroy
        format.json { render json: @school }
      else
        format.json { render json: @school.errors }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def params_school
    params.require(:school).permit(:name, :description)
  end
end
