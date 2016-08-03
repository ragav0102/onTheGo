class SessionsController < ApplicationController

  def new

  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
    	# Sign the user in and redirect to the user's show page.
    	sign_in user
    	redirect_to user
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
