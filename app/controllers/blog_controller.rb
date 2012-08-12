class BlogController < ApplicationController
  layout 'blog'

  def show_rubric
    @rubric = Rubric.find(params[:id])
  end

  def show_article
    @article = Article.front_versions.find(params[:id])
  end
end
