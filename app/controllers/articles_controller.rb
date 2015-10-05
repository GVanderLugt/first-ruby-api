class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @article = @user.articles.new
  end

  def edit
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.create(article_params)

    if @article.save
      redirect_to user_article_path(@user, @article)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to user_article_path(@user, @article)
    else
      render 'edit'
    end
  end

  def destroy
   @user = User.find(params[:user_id ])
   @article = @user.articles.find(params[:id])
   @article.destroy

   redirect_to user_path(@user)
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
