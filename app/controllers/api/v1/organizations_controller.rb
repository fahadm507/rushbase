class Api::V1::OrganizationsController < ApplicationController
  before_action :authenticate_user!,  only: [:create,:update,:new,:destroy]
  respond_to :json

  def index
    @organizations = Organization.all
    render json: @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    render json: @organization
  end

  def new
    @organization = Organization.new
    render json:@organization
  end

  def create
    @organization = Organization.new(params_organization)
    @organization.user_id = current_user.id

    respond_to do |format|
      if @organization.save
        format.json { render json: @organizaton, status: :created, location: @organization }
      else
        format.json { render json: @organization.errors, status: :unprocessable_entity }
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
