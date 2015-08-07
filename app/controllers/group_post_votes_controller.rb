class GroupPostVotesController < ApplicationController
  before_action :set_group_post_vote, only: [:show, :edit, :update, :destroy]

  def show
    @group_post_vote = GroupPostVote.find(params[:id])
  end

  def new
    @group_post_vote = GroupPostVote.new
  end

  def edit
    @group_post_vote = GroupPostVote.find(params[:id])
  end

  def create
    @group_post_vote = GroupPostVote.new(group_post_vote_params)
    @group_post_vote.user_id = current_user.id
    @group_post_vote.group_post_id = params[:group_post_id]

    respond_to do |format|
      if @group_post_vote.save
        format.html { redirect_to @group_post_vote, notice: 'GroupPostVote was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @group_post_vote }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @group_post_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group_post_vote.update(group_post_vote_params)
        format.html { redirect_to @group_post_vote, notice: 'GroupPostVote was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_post_vote }
      else
        format.html { render :edit }
        format.json { render json: @group_post_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group_post_vote.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to group_post_votes_url, notice: 'GroupPostVote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_post_vote
      @group_post_vote = GroupPostVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_post_vote_params
      params[:group_post_vote]
    end
end
