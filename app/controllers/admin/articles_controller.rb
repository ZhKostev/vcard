class Admin::ArticlesController < Admin::ApplicationController
  before_filter :find_rubrics, :only => [:new, :edit, :create, :update]

  def index
    @articles = Article.where('1=1').page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new()
    @article.attributes = params[:article]
    if @article.save
      redirect_to articles_path, :success => "New Article was successfully added."
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to articles_path, :success => "New Article was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, :notice => "Article was successfully deleted."
  end

  private
  def find_rubrics
    @rubrics = Rubric.all
  end
end
