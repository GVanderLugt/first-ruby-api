class CommentsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to user_article_path(@user, @article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
