class HousesController < ApplicationController
  
  before_filter :signed_in_user, only: [:create, :edit, :destroy]

  def new
    @house = House.new
  end

  def show
    @houses = House.find(params[:id])
  end

  def create
    @house = current_user.houses.create(params[:house])
    if @house.save
      flash[:success] = "Wait for people :)"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
    @house = current_user.House.find(params[:id])
  end

  def index
  end
  

end
