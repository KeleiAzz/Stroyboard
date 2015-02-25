class SessionsController < ApplicationController
  def new

  end
  def create
    developer = Developer.find_by(email: params[:session][:email])
    admin = Admin.find_by(email: params[:session][:email])
    # cookies[:admin_id] = {value: admin.id}
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to home_path

    elsif developer && developer.authenticate(params[:session][:password])
      # Log the developer in and redirect to the developer's show page.
      log_in developer
      redirect_to home_path

    else
      # Create an error message.
      flash[:notice] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
