class PostCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create

    @post = UserPost.find(params[:user_post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_post_id = @post.id
    @post_comment.user_id = current_user.id

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to user_path(@post.user)}
        format.js {}
        format.json { render :show, status: :created, location: @post_comment }
      else
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post_comment = PostComment.find(params[:id])

    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.js {}
        format.json { render json: @post_comment, status: :ok }
      else
        format.js {}
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])

    respond_to do |format|
      if @post_comment.destroy
        format.json { render json: @post_comment }
        format.js {}
      else
        format.json { render json: @post_comment.errors }
        format.js{}
      end
    end
  end

  private
    def post_comment_params
      params.require(:post_comment).permit(:body)
    end

end
