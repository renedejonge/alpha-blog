class ArticlesController < ApplicationController
  
  public

  def new
    @article = Article.new
  end

  def create
    #create action receives form data from new view through the params hash
    #render plain: params[:article].inspect
    
    #course video 34
    #@article = Article.new(article_params) #article_params is private method
    #@article.save #hier wordt het artikel naar de database geschreven
    #redirect_to article_path(@article) #article_path (show) niet articles_path (index)

    #course video 36 aangepast
    #@article = Article.new(article_params)
    #opgeslagen = @article.save #hier daadwerkelijk opgeslagen
    #if opgeslagen
    #  redirect_to article_path(@article)
    #else
    #  render 'new'
    #end

    #course video 36
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    #Bij de redirect naar show wordt er een artikel meegegeven hetgeen een :id oplevert die ook in de url zichtbaar wordt
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title,:description)
    end

end