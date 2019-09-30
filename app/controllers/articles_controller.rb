class ArticlesController < ApplicationController
  include ArticlesHelper

  def index # chaque méthode dans le controller doit beneficier d'une vue index.html.erb
    # utilisation de @ pour créer une variable d'instance = qui sera disponible dans le controller et la vue
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    # fail # la méthode fail permet de stopper la requête de création dans notre cas, et de nous laisser examiner les paramètres de la requête
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id]).destroy

    flash.notice = "Article '#{@article.title}' Destroyed!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end
end
