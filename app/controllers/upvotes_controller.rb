class UpvotesController < ApplicationController
  before_action :set_upvote, only: [:show, :edit, :update, :destroy]

  def index
    @upvotes = Upvote.all
  end


  def show
    @upvote = Upvote.find(params[:id])
  end

  def new
    @upvote = Upvote.new
  end

  def edit
    @upvote = Upvote.find(params[:id])
  end

  def create
    @upvote = Upvote.new(upvote_params)
    @upvote.user_id = current_user.id
    @upvote.user_post_id = params[:user_post_id]
    @upvote.count += 1

    respond_to do |format|
      if @upvote.save
        format.html { redirect_to @upvote, notice: 'Upvote was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @upvote }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @upvote.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /upvotes/1
  # PATCH/PUT /upvotes/1.json
  def update
    respond_to do |format|
      if @upvote.update(upvote_params)
        format.html { redirect_to @upvote, notice: 'Upvote was successfully updated.' }
        format.json { render :show, status: :ok, location: @upvote }
      else
        format.html { render :edit }
        format.json { render json: @upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @upvote.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to upvotes_url, notice: 'Upvote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upvote
      @upvote = Upvote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upvote_params
      params[:upvote]
    end
end
