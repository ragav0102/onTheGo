class HousesController < ApplicationController
  
  before_filter :signed_in_user, only: [:new,:create, :edit, :destroy, :index]



  def new
    @house = House.new
  end

  def show
    @house = House.find(params[:id])

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
    @houses = House.paginate(page: params[:page])
  end
  

end
