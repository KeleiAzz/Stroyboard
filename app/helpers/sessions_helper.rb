module SessionsHelper
  def log_in(user)
    if user.class == Admin
      session[:admin_id] = user.id
      session[:developer_id] = nil
    elsif user.class == Developer
      session[:admin_id] = nil
      session[:developer_id] = user.id
    # session[:admin_id] = admin.id
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
end