class SessionsController < ApplicationController

  def new

  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    	flash[:success] = "You are in.. Try hosting and earn onTheGo!"
  	else
    	# Create an error message and re-render the signin form.
    	flash.now[:error] = "Mismatch found.. Please try again."
    	render 'new'
  	end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
