class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update,:index, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy, :index]
  before_filter :user_page, only: [:show, :destroy]


  def show
    @houses = @user.houses.paginate(page: params[:page])
    booked_ids = Booking.select("house_id").where(user_id: current_user.id).map(&:house_id)
    @booked = House.find_all_by_id(booked_ids)
    #House.where("house_id IN (#{Booking.select("house_id").where(user_id: current_user.id)})")
  end
  
  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "You are in :)"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @user.update_attributes(params[:user])
      # Handle a successful update.
      flash[:success] = "Your info has been updated!"
      sign_in @user
      redirect_to @user
    else  
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    @user.destroy
    flash[:success] = "User fired :D"
    redirect_to users_url
  end


  private


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end



end
