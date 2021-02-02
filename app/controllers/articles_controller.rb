class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "mateus", password: "123", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    
    respond_to do |format| 
      format.html
      format.json { render json: @article.to_json(only: [:id])}
    end
  end

  def new
    @article = Article.new
  end

  def create
    
    @article = Article.new(article_params)
    @article.avatar.attach(article_params[:avatar])
    # byebug
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, flash: {notice: "Artigo deletado com sucesso!"}
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :avatar, :nome)
    end
end
