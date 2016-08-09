class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update,:index, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy, :index]


  def show
    @user = User.find(params[:id])
    @houses = @user.houses.paginate(page: params[:page])
    @booked_houses = Booking.select(:house_id).group(:house_id).having("user_id = 2")

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    User.find(params[:id]).destroy
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
