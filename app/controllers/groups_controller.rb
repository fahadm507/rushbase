class GroupsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :json, :html

  def index
    @groups = Group.paginate(page: params[:page], per_page: 50)
    respond_to do |format|
      format.html { }
      format.js {}
      format.json { render json: @groups, location: @groups }
    end
  end

  def show
    @new_post = GroupPost.new
    @group = Group.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js {}
      format.json { render json: @group, location: @group }
    end
  end

  def edit
    @group = Group.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.js {}
      format.json { render json: @group, location: @group }
    end
  end

  def new
    @Group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'study Group was successfully created.' }
        format.js {}
        format.json { render @group, status: :created, location: @group }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'study Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @Group = Group.find(params[:id])
    @Group.destroy
    respond_to do |format|
      format.html { redirect_to Groups_url, notice: 'study Group was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    def Group_params
      params.require(:Group).permit(:name, :organization)
    end
end
