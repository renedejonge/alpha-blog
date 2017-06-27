class ArticlesController < ApplicationController
  
  public

  def new
    @article = Article.new
  end

  def create
    #create action receives form data from new view through the params hash
    #render plain: params[:article].inspect
    @article = Article.new(article_params) #article_params is private method
    @article.save #hier wordt het artikel naar de database geschreven
    redirect_to article_path(@article)
  end

  private

    def article_params
      params.require(:article).permit(:title,:description)
    end

end