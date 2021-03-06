class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    authenticate_user!
    @links = Link.all.sort_by { |link| link.votes.count }.reverse
    @vote = Vote.new
    @comment = Comment.new
    @user = current_user
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])
    @comment = Comment.new
    @user = current_user
    # @comments = Comment.
    # @vote = Vote.new
  end

  # GET /links/new
  def new
    authenticate_user!
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
    authenticate_user!
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    authenticate_user!

    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Thanks for contributing' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    authenticate_user!

    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    authenticate_user!
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :info, :user_id, :board_id)
    end
end
