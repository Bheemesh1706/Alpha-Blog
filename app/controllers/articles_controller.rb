class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy] # this performs the given fn b4 the mentiond method's 
 

  # GET /articles/1 or /articles/1.json
  def show  
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article= Article.new(article_params) #white listing title and description
   
    if  @article.save #Adding the article to the database
        flash[:notice] ="Article was created Sucssfully!"
      redirect_to article_path(@article) #rediecting to show function using uri
      # redirect_to @article  is another method for the above one
    else
      render 'new'
    end
  end

  def update
    
     
     if @article.update(article_params)
        flash[:notice] = "Article was Updated"
        redirect_to @article
     else
      render 'edit'
     end

  end

  def edit
  end

  def destroy  
    @article.destroy
    redirect_to articles_path
  end

      private
          def set_article
            @article = Article.find(params[:id])
          end

          def article_params
            params.require(:article).permit(:title, :description)
          end
 
end
