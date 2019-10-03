class BlogsController < ApplicationController

  def index
    @articles = Article.order('id DESC').limit(5) 
  end

  def new
  end

  def create
    Article.create(blog_params)
  end

  def destroy
    article = Article.find(params[:id])
      if article.user_id === current_user.id
        article.destroy
      end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(blog_params) 
    end
  end

  private
  def blog_params
    params.permit(:title, :image, :content)
  end

end
