class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end

  # def create
  #   @article = Article.new(article_params)
  #
  #   if @article.save
  #     render json: @article, status: :created, location: @article
  #   else
  #     render json: @article.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /articles/1
  # # PATCH/PUT /articles/1.json
  # def update
  #   @article = Article.find(params[:id])
  #
  #   if @article.update(article_params)
  #     head :no_content
  #   else
  #     render json: @article.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /articles/1
  # # DELETE /articles/1.json
  # def destroy
  #   @article.destroy
  #
  #   head :no_content
  # end
  #
  # private
  #
  #   def set_article
  #     @article = Article.find(params[:id])
  #   end
  #
  #   def article_params
  #     params[:article]
  #     # params.require(:article).permit(:title, :content, :category_id, :source_link, :image_src, :comment_id)
  #   end
end
