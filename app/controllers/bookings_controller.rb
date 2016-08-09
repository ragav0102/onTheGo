class BookingsController < ApplicationController
  before_filter :signed_in_user

  def create
  	@booking = Booking.create(params[:booking])
  	if House.find(@booking.house_id).availability? && current_user.id != House.find(@booking.house_id).user_id 
  		@booking.save
  		House.find(@booking.house_id).toggle!(:availability)
  		flash[:success] = "You have successfully booked #{House.find(@booking.house_id).name}"
	    respond_to do |format|
	      format.html { redirect_to house_path( id: @booking.house_id) }
	      format.js
	    end
  	else
  		if current_user.id != House.find(@booking.house_id).user_id 
  			flash[:error] = "Sorry!! #{House.find(@booking.house_id).name} cannot be booked. Try other houses."
  			redirect_to root_path
  		else
  			flash[:error] = "current_user"
  		end
  	end
  end



  def destroy
  	@booking = Booking.find(params[:id])
  	if  !(House.find(@booking.house_id).availability)  && current_user.bookings.find_by_house_id(@booking.house_id)
  		
  		House.find(@booking.house_id).toggle!(:availability)
  		redirect_house_id = @booking.house_id
  		flash[:success] = "Successfully unbooked!"
  		Booking.find_by_house_id(@booking.house_id).destroy
	    respond_to do |format|
	      format.html { redirect_to house_path( id: redirect_house_id) }
	      format.js
	    end	
  	#else
  	#	flash[:success] = "sjhcijs"
  	end
  end
end
