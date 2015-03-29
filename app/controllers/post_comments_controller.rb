class PostCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create
    @post = Post.find(params[:id])
    @post_comment = @post.post_comments.build(post_comment_params)

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to post}
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
      params.require(:post_comment).permit(:description)
    end

end
