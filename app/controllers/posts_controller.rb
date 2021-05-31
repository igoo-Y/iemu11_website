class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_board

  # GET /posts or /posts.json
  def index
    @posts = @board.present? ? @board.posts.all : Post.all
    @posts = Post.with_rich_text_content_and_embeds
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    @post.increment!(:view_count)
  end

  # GET /posts/new
  def new
    @post = @board.present? ? @board.posts.new : Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts or /posts.json
  def create
    @post = @post = @board.present? ? @board.posts.new(post_params) : Post.new(post_params)
    @post.user_id = current_user.id
    @post.user_name = current_user.user_name

    respond_to do |format|
      if @post.save
        format.html { redirect_to (@board.present? ? [@post.board, @post] : @post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to (@board.present? ? [@post.board, @post] : @post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    respond_to do |format|
      format.html {
        redirect_to board_path(@board), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    if @board.present?
      @post = @board.posts.find(params[:id])
    end
  end

  def set_board
    @board = Board.find(params[:board_id]) if params[:board_id].present?
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content, :board_id, :user_id, :view_count, :user_name)
  end
end