class Admin::RubricsController < Admin::ApplicationController

  def index
    @rubrics = Rubric.where('1=1').page(params[:page])
  end

  def new
    @rubric = Rubric.new
  end

  def create
    @rubric = Rubric.new(params[:rubric])
    if @rubric.save
      redirect_to rubrics_path, :success => "New Rubric was successfully added."
    else
      render :new
    end
  end

  def edit
    @rubric = Rubric.find(params[:id].to_i)
  end

  def update
    @rubric = Rubric.find(params[:id].to_i)
    if @rubric.update_attributes(params[:rubric])
      redirect_to rubrics_path, :success => "New Rubric was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @rubric = Rubric.find(params[:id])
    @rubric.destroy
    redirect_to rubrics_path, :notice => "Rubric was successfully deleted."
  end
end
