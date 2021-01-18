class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.first
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = "パスワードが正しくありません．"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
