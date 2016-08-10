class HousesController < ApplicationController
  
  before_filter :signed_in_user, only: [:new,:create, :edit, :destroy, :index]
  before_filter :correct_user, only: [:destroy, :edit]
  before_filter :current_house, only: [:show,:destroy]


  def new
    @house = House.new
  end

  def show
    #@house = House.find(params[:id])
    @booking = Booking.new(house_id: @house.id, user_id: current_user.id)

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
    if current_user.id == @user.id || current_user.admin?
      @house.destroy
      flash[:success] = "Listing deleted!"
      redirect_to current_user
    else 
      redirect_to current_user
    end
  end

  def edit

  end

  def index
    params[:city_name] ||= "Chennai"
    if params[:search]
      @houses = House.search(params[:search],params[:city_name]).order("created_at DESC").paginate( :per_page => 10, page: params[:page])  #.order("created_at DESC")
    else
      @houses = House.search(" ", params[:city_name]).paginate( :per_page => 10, page: params[:page]).order("name DESC")
    end
  end

  private

    def correct_user
      @house = current_user.houses.find_by_id(params[:id])
      redirect_to root_url if @house.nil?
    end  

end
