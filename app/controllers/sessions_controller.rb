class SessionsController < ApplicationController
  def new
  end

  def create
  	

  	user = User.find_by(email: params[:session][:email].downcase)
    
  	if user && user.authenticate(params[:session][:password])
  		# Log user in and redirect user to welcome page.
  		log_in user
            flash[:success] = "Welcome to the Sample App!"
  		redirect_to user
  	else 
  		# Show an error message.
  		flash.now[:danger] = "Invalid email/password combination."
		render 'new'
  	end 
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
