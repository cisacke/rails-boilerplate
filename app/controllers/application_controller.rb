class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def currently_signed_in
    return nil unless session[:session_token]
    @currently_signed_in ||= User.find_by(session_token: session[:session_token])
  end

  def sign_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def sign_out!
    currently_signed_in.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def is_signed_in?
    !!currently_signed_in
  end

  def require_signed_in!
    redirect_to new_session_url unless is_signed_in?
  end

  private

  def belongs_to_current_user(photo)
    return false if !is_signed_in?
    photo.user.id == currently_signed_in.id
  end

  helper_method :belongs_to_current_user
end
