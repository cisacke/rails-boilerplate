class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])
    respond_to do |format|
      if @user
        sign_in!(@user)
        format.html { redirect_to root_url }
      else
        format.js
      end
    end

  end

  def destroy
    sign_out!
    redirect_to root_url
  end
end
