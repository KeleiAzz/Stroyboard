module SessionsHelper
  def log_in(user)
    if user.class == Admin
      session[:admin_id] = user.id
      session[:developer_id] = nil
    elsif user.class == Developer
      session[:admin_id] = nil
      session[:developer_id] = user.id
    end
  end
  def current_user
    if !session[:admin_id].nil?
      @current_user ||= Admin.find_by(id: session[:admin_id])
    elsif !session[:developer_id].nil?
      @current_user ||= Developer.find_by(id: session[:developer_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  def log_out
    session.delete(:admin_id)
    session.delete(:developer_id)
    @current_user = nil
  end

  def logged_in_user
    unless logged_in?
      flash[:notice] = "Please log in."
      redirect_to root_path
    end
  end

end
