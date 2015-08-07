class GroupMembersController < ApplicationController
  respond_to :js, :json, :html
  before_action :set_group_member, only: [:show, :edit, :update, :destroy]

  def index
    @group = Group.find(params[:group_id])
  end

  def show
    @group_member = GroupMember.find(params[:id])
  end

  def new
    @group_member = GroupMember.new
  end

  def edit
    @group_member = GroupMember.find(params[:id])
  end

  def create
    @group_member = GroupMember.new(group_member_params)
    @group_member.user_id = current_user.id
    @group_member.group_id = params[:group_id]

    respond_to do |format|
      if @group_member.save
        format.html { redirect_to group_url(@group_member.group), notice: 'groupMember was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @group_member }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group_member.update(group_member_params)
        format.html { redirect_to @group_member.group, notice: 'GroupMember was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_member }
      else
        format.html { render :edit }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group_member.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to group_url(@group_member.group), notice: 'GroupMember was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_group_member
      @group_member = GroupMember.find(params[:id])
    end

    def group_member_params
      params[:group_member]
    end
end
