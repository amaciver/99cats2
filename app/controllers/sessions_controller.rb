class SessionsController < ApplicationController
  before_action :authorize_user, only: [:new]

  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      @user.reset_session_token!
      login!(@user)
      redirect_to (cats_url)
    else
      flash[:errors] = "User does not exist."
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
  

end
