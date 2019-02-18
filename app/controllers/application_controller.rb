class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def sign_in(user, set_cookie = false)
    @auth_key, user_auth_key = UserAuthKey.create_for_user(user)

    cookies.permanent[:auth_key] = @auth_key if set_cookie
    params[:auth_key] = @auth_key
    user.update_attribute(:login_attempt_count, 0)

    @current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user || current_user_auth_key&.user
  end

  def current_user_auth_key
    return nil if current_auth_key.blank?
    encrypted_auth_key = UserAuthKey.secure_hash(current_auth_key)
    return UserAuthKey.find_by(encrypted_key: encrypted_auth_key)&.user
  end

  def current_auth_key
    params[:auth_key].presence || cookies[:auth_key].presence
  end

  def sign_out
    current_user_auth_key&.destroy
    params[:auth_key] = nil
    cookies.delete(:auth_key)
    @current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

end
