class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end

  # def new
  #   @article = Article.new
  # end
  #
  # def create
  #   @article = Article.new(article_params)
  #
  #   if @article.save
  #     flash[:success] = "Article created!"
  #     redirect_to root_url
  #   else
  #     render 'new'
  #   end
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end
  #
  # private
  #
  #   def set_article
  #     @article = Article.find(params[:id])
  #   end
  #
  #   def article_params
  #     params.require(:article).permit(:title, :text_preview, :content, :category_id, :source_link, :image_src, :comment_id)
  #   end
end
