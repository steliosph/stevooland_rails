class SessionsController < ApplicationController

	def new
		user = User.new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
  		if user && user.authenticate(params[:session][:password])
    		sign_in user
      		redirect_to root_url
  		else
    		flash.now[:danger] = 'Invalid email/password combination'
      		render 'new'
  		end
	end

	def destroy
		sign_out
		flash.now[:success] = 'Leaving already ? No need to worry ... someone will attach you soon !'
    	redirect_to root_url
	end
end
