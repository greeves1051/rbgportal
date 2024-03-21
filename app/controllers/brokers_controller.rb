class BrokersController < ApplicationController
  def index
    @brokers = Broker.all
  end

  def show
    @broker = Broker.find(params[:id])
  end

  def new
    @broker = Broker.new
  end

  def create
    @broker = Broker.new(broker_params)
    if @broker.save
      redirect_to brokers_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @broker = Broker.find(params[:id])
  end

  def update
    @broker = Broker.find(params[:id])
    if @broker.update(broker_params)
       redirect_to brokers_path
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def broker_params 
    params.require(:broker).permit(:name)
  end
end
