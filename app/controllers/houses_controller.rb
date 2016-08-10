class HousesController < ApplicationController
  
  before_filter :signed_in_user, only: [:new,:create, :edit, :destroy, :index]
  before_filter :correct_user, only: :destroy


  def new
    @house = House.new
  end

  def show
    @house = House.find(params[:id])
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
    if current_user == @user || current_user.admin?
      House.find(params[:id]).destroy
      flash[:success] = "Listing deleted!"
      respond_to do |format|
        format.html { redirect_to @user }
        #format.json { head :no_content }
        format.js   { render :layout => false }
      end
    else 
      redirect_to current_user
    end
  end

  def edit
    @house = current_user.House.find(params[:id])
  end

  def index
    @houses = House.all
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
