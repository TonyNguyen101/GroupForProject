class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find_by_id(params[:id])
  end
   def new
   	@user = User.find_by_id(session[:user_id])
  	@article = Article.new 
  end
   def create

   	 @article = Article.create article_params
    if @article.save
      
      redirect_to user_articles_path(session[:user_id]), flash: {success: "Created!"}
    else
      redirect_to new_user_article_path, flash: {error: @article.errors.full_messages}
	end
  	
  end

  def compare
  end

  
  private
  def article_params
    params.require(:article).permit(:url, :title)
  end
end
