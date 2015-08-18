class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.group_post_id = params[:group_post_id]
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html {}
        format.js {}
        format.json { render json: @comment }
      else
        format.js {}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.json { render json: @comment, location:  user_comment_url(@comment.user_group_post, @comment) }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.json { render json: @comment, location:  user_comment_url(@comment.user_group_post, @comment) }
      format.js {}
      format.html {}
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.js {}
        format.json { render json: @comment, status: :ok, location:  @comment }
      else
        format.js {}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.destroy
        format.json { render json: @comment }
        format.js {}
      else
        format.json { render json: @comment.errors }
        format.js{}
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:description)
    end
end
