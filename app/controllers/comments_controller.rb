class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def index
    @comments = Comment.all
  end


  def new
    authenticate_user!
    @comment = Comment.new
  end

  def edit
  end

  def create
    authenticate_user!

    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authenticate_user!

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :link_id, :user_id)
    end
end
