class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in!(@user)
        format.html { redirect_to root_url }
      else
        format.js
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password)
  end
end
