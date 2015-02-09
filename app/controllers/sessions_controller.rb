class SessionsController < ApplicationController
  def new
  end
  def create
    developer = Developer.find_by(email: params[:session][:email].downcase)
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      flash[:notice] =  'Log in successfully, your group is admin'
      redirect_to admins_path

    elsif developer && developer.authenticate(params[:session][:password])
      # Log the developer in and redirect to the developer's show page.
      log_in developer
      flash[:notice] = 'Log in successfully, your group is developer'
      redirect_to projects_path
    else
      # Create an error message.

      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
