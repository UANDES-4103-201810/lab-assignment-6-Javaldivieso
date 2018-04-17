class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    	@user = User.new(user_params)
	    	if @user.save
		cookies.signed[:user_id] = @user.id
		flash[:notice] = "User created succesfully"
		redirect_to root_url
		else
		flash[:notice] = "Error in registrations"
		redirect_to registrations_url
		end
	end
	private
		def user_params
	      		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	    	end
        
end
