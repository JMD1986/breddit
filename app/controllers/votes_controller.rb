# class CommentsController < ApplicationController
#   before_action :set_comment, only: [:show, :edit, :update, :destroy]



#   # POST /comments
#   # POST /comments.json
#   def create
#     authenticate_user!

#     @vote = Vote.new(comment_params)

#     respond_to do |format|
#       if @comment.save
#         format.html { redirect_to :back }
#         format.json { render :show, status: :created, location: @comment }
#       else
#         format.html { render :new }
#         format.json { render json: @comment.errors, status: :unprocessable_entity }
#       end
#     end
#   end


#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_comment
#       @vote = Vote.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def comment_params
#       params.require(:vote).permit(:body, :link_id, :user_id)
#     end
# end
