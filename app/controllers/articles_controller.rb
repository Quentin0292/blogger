class ArticlesController < ApplicationController
  def index # chaque méthode dans le controller doit beneficier d'une vue index.html.erb
    # utilisation de @ pour créer une variable d'instance = qui sera disponible dans le controller et la vue
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
