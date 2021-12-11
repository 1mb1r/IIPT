class PostsController < ApplicationController

  before_action :set_post, only: [:show, :update]
  before_action :authenticate_user!, only: [:post, :update]
  
  def index
    @posts = Post.order(:id)
    render json: @posts
  end

  def show
    render json: @post
  end    

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.permit(:title, :content, :tag, :author, :image, :user_id)
  end     
end
  