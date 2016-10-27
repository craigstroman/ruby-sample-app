class SessionsController < ApplicationController
  def new
  end

  def create
      if !params.include?(:session) # Log in omniauth user if not a standard user.
        user = User.from_omniauth(env["omniauth.auth"])
        
        session[:user_id] = user.id
        session[:omniauth_user] = true
        log_in user
        redirect_back_or user
      else
      	user = User.find_by(email: params[:session][:email].downcase)
        
      	if user && user.authenticate(params[:session][:password])
                if user.activated?
                # Log user in and redirect user to welcome page.
                session[:omniauth_user] = false
                log_in user
                params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                redirect_back_or user
              else
                message = "Account not activated."
                message += "Check your emailfor the activation link."
                flash[:warning] = message
                redirect_to root_url
              end
      	else 
              # Show an error message.
              flash.now[:danger] = "Invalid email/password combination."
              render 'new'
      	end 
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
