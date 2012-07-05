class Admin::ArticlesController < Admin::ApplicationController
  before_filter :find_rubrics, :only => [:new, :edit, :create, :update]
  after_filter :publish_article, :only => [:create, :update]

  def index
    @articles = Article.originals.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
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

  #publish article if it valid and admin submit as "Publish"
  def publish_article
    @article.publish! if params[:commit] == 'Publish' && @article.valid?
  end
end
