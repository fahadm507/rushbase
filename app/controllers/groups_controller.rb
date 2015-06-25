class GroupsController < ApplicationController

  def index
    @groups = Group.paginate(page: params[:page], per_page: 50)
    respond_to do |format|
      format.html {}
      format.js {}
      format.json { render json: @groups }
    end
  end

  def show
    @group = Group.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js {}
      format.json {render json: @group}
    end
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    binding.pry
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, :description, :industry_id, :organization)
    end
end
