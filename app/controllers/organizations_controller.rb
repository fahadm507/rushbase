class OrganizationsController < ApplicationController
  before_action :authenticate_user!,  only: [:create,:update,:new,:destroy]
  respond_to :json

  def index
    @organizations = Organization.all
    respond_to do |format|
      format.html {}
      format.json { render json: @organizaton, status: :created, location: @organization }
      format.js {}
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(params_organization)
    @organization.user_id = current_user.id

    respond_to do |format|
      if @organization.save
        format.html { redirect_to organizations_path,  notice: "organization was created"}
        format.json { render json: @organizaton, status: :created, location: @organization }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def update
    respond_to do |format|
      @organization = Organization.find(params[:organization_id])
      if @organization.update(organization_params)
        format.json { render json: @organization, status: :ok, location: @organization }
      else
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    respond_to do |format|
      if @organization.destroy
        format.json { render json: @organization }
      else
        format.json { render json: @organization.errors }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def params_organization
    params.require(:organization).permit(:name, :description)
  end
end
