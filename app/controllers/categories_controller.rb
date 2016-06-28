class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category   = Category.find(params[:id])
    @articles   = @category.articles
  end
end
