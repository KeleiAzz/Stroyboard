class SessionsController < ApplicationController
  def new
  end
  def create
    developer = Developer.find_by(email: params[:session][:email])
    admin = Admin.find_by(email: params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to home_path

    elsif developer && developer.authenticate(params[:session][:password])
      # Log the developer in and redirect to the developer's show page.
      log_in developer
      redirect_to home_path

    else
      # Create an error message.
<<<<<<< HEAD
#      flash[:danger] = params[:session][:email]
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
=======
      # flash[:danger] = params[:session][:email]
     flash[:notice] = 'Invalid email/password combination'
>>>>>>> origin/master
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
