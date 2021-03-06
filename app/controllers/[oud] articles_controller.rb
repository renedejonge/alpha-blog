class ArticlesController < ApplicationController
  
  # actions of volgorde van maken, gebruikelijke volgorde: index, show, new, edit, create, update, distroy

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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all   # niet te verwarren met gebruik van @article variabele
  end

  def destroy
      @article = Article.find(params[:id])
      @article.destroy # deletes article from the database
      flash[:notice] = "Article was successfully deleted"
      redirect_to articles_path # stuurt door naar index van articles
  end

  private

    def article_params
      params.require(:article).permit(:title,:description)
    end

end