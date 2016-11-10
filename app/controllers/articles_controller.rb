class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all  
  end

  def show
    # NOTE: Rails will pass all instance variables '@something' to the view. So you can store results there and pass them to the view
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # This test code just renders the data on the page
    #render plain: params[:article].inspect

    @article = Article.new(article_params)

    # Saves the data in the DB, but only if the creation returns TRUE (i.e., response was valid, data was inserted without error)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end

  # ALWAYS PUT THIS AFTER YOUR CRUD STUFF
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
