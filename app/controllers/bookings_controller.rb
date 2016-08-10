class BookingsController < ApplicationController
  before_filter :signed_in_user

  def create
  	@booking = Booking.create(params[:booking])
    house_curr = House.find(@booking.house_id)
  	if house_curr.availability? && current_user.id != house_curr.user_id 
  		@booking.save
  		house_curr.toggle!(:availability)
  		flash[:success] = "You have successfully booked #{house_curr.name}"
	    respond_to do |format|
	      format.html { redirect_to house_path( id: @booking.house_id) }
	      format.js
	    end
  	else
  		if current_user.id != house_curr.user_id 
  			flash[:error] = "Sorry!! #{house_curr.name} cannot be booked. Try other houses."
  			redirect_to root_path
  		else
  			flash[:error] = "current_user"
  		end
  	end
  end



  def destroy
  	@booking = Booking.find(params[:id])
    house_curr = House.find(@booking.house_id)
  	if  !(house_curr.availability)  && current_user.bookings.find_by_house_id(@booking.house_id)  		
  		house_curr.toggle!(:availability)
  		redirect_house_id = @booking.house_id
  		flash[:success] = "Successfully unbooked!"
  		@booking.destroy
	    respond_to do |format|
	      format.html { redirect_to house_path( id: redirect_house_id) }
	      format.js
	    end	
  	#else
  	#	flash[:success] = "sjhcijs"
  	end
  end
end
