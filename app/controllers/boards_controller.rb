class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index

    @boards = Board.all
    @board = Board.new
    @links = Link.all.sort_by { |link| link.votes.count }.reverse
    @vote = Vote.new
    @comment = Comment.new
  end


  # GET /boards/1
  # GET /boards/1.json
  def show
    @board = Board.find(params[:id])
    @link = Link.all.sort_by { |link| link.votes.count }.reverse
    @user = current_user
  end

  # GET /boards/new
  def new
    authenticate_user!
    @board = Board.new
  end

  # POST /boards
  # POST /boards.json
  def create
    authenticate_user!

    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    authenticate_user!

    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    authenticate_user!

    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:topic)
    end
end
