class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "You have posted a new tweet!"
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "You have edited this tweet！"
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "You have deleted the tweet!"
  end
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post =Post.find(params[:id])
  end
end
