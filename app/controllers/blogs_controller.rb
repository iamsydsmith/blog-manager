class BlogsController < ApplicationController
  before_action :signed_in_user
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :verify_correct_user, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = current_user.blogs.order(created_at: :desc)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
     @post = Blog.find(params[:id])
     @comments = @blog.comments
     @comment = Comment.new
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blogs_path, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_path, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :photo, :post)
    end

    def verify_correct_user
       @blog = current_user.blogs.find_by(id: params[:id])
       redirect_to root_url, notice: 'Access Denied!' if @blog.nil?
     end
end
