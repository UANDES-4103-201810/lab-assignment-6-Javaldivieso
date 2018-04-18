class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:emails].downcase)
		if user && user.password == params[:session][:password]
			session[:user]=user
			cookies.permament.singed[:user] = @user.id
			flash[:notice] = 'User logged in succesfully'
			redirect_to user_path(user)
		else
			flash[:notice] = 'Login Failed'
			redirect_to root_path
		end
	end

	def destroy
		@_current_user = session[:current_user_id] = nil
		redirect_to log_out_path
	end
end
