class PostsController < ApplicationController
  before_filter :authenticate, except: [ :index, :show ]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.sort_by_newest
  end

  # GET /posts/1
  def show
   
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.pictures.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'BRAVO!'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
 
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Le poste a bien été corrigé.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1

  def destroy
    @post.destroy
      redirect_to posts_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
    @post.pictures.build
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, pictures_attributes: [:picture])
  end



  def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == "admin" && password == "secret"
    end
  end
end
