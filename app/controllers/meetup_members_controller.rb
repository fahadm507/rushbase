class MeetupMembersController < ApplicationController
  before_action :set_meetup_member, only: [:show, :edit, :update, :destroy]

  def index
    @meetup_members = MeetupMember.all
  end

  def show
    @meetup_member = MeetupMember.find(params[:id])
  end

  def new
    @meetup_member = MeetupMember.new
  end

  def edit
    @meetup_member = MeetupMember.find(params[:id])
  end

  def create
    @meetup_member = MeetupMember.new(meetup_member_params)
    @meetup_member.user_id = current_user.id
    @meetup_member.meetup_id = params[:meetup_id]

    respond_to do |format|
      if @meetup_member.save
        format.html { redirect_to meetup_url(@meetup_member.meetup), notice: 'MeetupMember was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @meetup_member }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @meetup_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meetup_member.update(meetup_member_params)
        format.html { redirect_to @meetup_member.meetup, notice: 'MeetupMember was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetup_member }
      else
        format.html { render :edit }
        format.json { render json: @meetup_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meetup_member.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to meetup_url(@meetup_member.meetup), notice: 'MeetupMember was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_meetup_member
      @meetup_member = MeetupMember.find(params[:id])
    end

    def meetup_member_params
      params[:meetup_member]
    end
end
