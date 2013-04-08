class ArticlesController < ApplicationController


   before_filter :require_login, except: [:index, :show]

 
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article_id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.save

    flash.notice ="Giving birth to the '#{@article.title}' article."

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice ="About to incinerate the '#{@article.title} article."

    redirect_to article_path(@articles)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])

    flash.notice ="Article '#{@article.title}' updated!"

    redirect_to article_path(@article)
  end

end
