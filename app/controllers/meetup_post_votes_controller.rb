class MeetupPostVotesController < ApplicationController
  before_action :set_meetup_post_vote, only: [:show, :edit, :update, :destroy]
  before_action :meetup_member?, only: [:create, :edit, :update, :destroy]
  def show
    @meetup_post_vote = MeetupPostVote.find(params[:id])
  end

  def new
    @meetup_post_vote = MeetupPostVote.new
  end

  def edit
    @meetup_post_vote = MeetupPostVote.find(params[:id])
  end

  def create
    @meetup_post_vote = MeetupPostVote.new(meetup_post_vote_params)
    @meetup_post_vote.user_id = current_user.id
    @meetup_post_vote.meetup_post_id = params[:meetup_post_id]

    respond_to do |format|
      if @meetup_post_vote.save
        format.html { redirect_to @meetup_post_vote, notice: 'MeetupPostVote was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @meetup_post_vote }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @meetup_post_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meetup_post_vote.update(meetup_post_vote_params)
        format.html { redirect_to @meetup_post_vote, notice: 'MeetupPostVote was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetup_post_vote }
      else
        format.html { render :edit }
        format.json { render json: @meetup_post_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meetup_post_vote.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to meetup_post_votes_url, notice: 'MeetupPostVote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup_post_vote
      @meetup_post_vote = MeetupPostVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meetup_post_vote_params
      params[:meetup_post_vote]
    end
end
