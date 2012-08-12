class Admin::SubscribesController < Admin::ApplicationController

  def index
    @subscribes = Subscribe.page(params[:page])
  end

  def show
    @subscribe = Subscribe.find(params[:id])
  end

  def new
    @subscribe = Subscribe.new
  end

  def edit
    @subscribe = Subscribe.find(params[:id])
  end

  def create
    @subscribe = Subscribe.new(params[:subscribe])
    if @subscribe.save
      redirect_to @subscribe, notice: 'Subscribe was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @subscribe = Subscribe.find(params[:id])
    if @subscribe.update_attributes(params[:subscribe])
      redirect_to @subscribe, notice: 'Subscribe was successfully updated.'
    else
      render action: "edit"
    end
  end


  def destroy
    @subscribe = Subscribe.find(params[:id])
    @subscribe.destroy
    redirect_to subscribes_url
  end

end
