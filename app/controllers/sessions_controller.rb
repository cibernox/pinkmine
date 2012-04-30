class SessionsController < ApplicationController
  layout 'welcome'

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    respond_to do |format|
      format.html do
        if user
          redirect_back_or_to root_url, notice: "Logged in!"
        else
          flash.now.alert = "Email or password was invalid."
          render :new
        end
      end
      format.js do
        if user
          render action: :redirect
        else
          render partial: 'login_error'
        end
      end
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "Logged out!"
  end

end
