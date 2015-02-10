class SessionsController < ApplicationController
  def new
  end
  def create
    developer = Developer.find_by(email: params[:session][:email].downcase)
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to home_path

    elsif developer && developer.authenticate(params[:session][:password])
      # Log the developer in and redirect to the developer's show page.
      log_in developer
      redirect_to home_path
    else
      # Create an error message.

      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
    # render 'new'
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
