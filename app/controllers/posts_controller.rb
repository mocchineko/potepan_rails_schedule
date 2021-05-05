class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @post_count = Post.all.count
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def post_params
    params.permit(
      :title, :start, :last, :all_day, :content
      )
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        flash[:success] = "スケジュールを登録しました"
        redirect_to posts_path
      else
        flash[:danger] = "スケジュールを登録できませんでした"
        render :new
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
      if @post.save
        flash[:success] = "スケジュールを更新しました"
        redirect_to posts_path
      else
        flash[:danger] = "スケジュールを更新できませんでした"
        render :edit
      end
  end

  def destroy
    @post = Post.find_by!(id: params[:id])
    @post.destroy
    flash[:danger] = "スケジュールを削除しました"
    redirect_to posts_path
  end
end

