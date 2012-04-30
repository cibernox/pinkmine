class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      respond_to do |format|
        format.html { redirect_back_or_to root_url, notice: "Logged in!" }
        format.js   { render action: :redirect }
      end
    else
      respond_to do |format|
        format.html do
          flash.now.alert = "Email or password was invalid."
          render :new
        end
        format.js
      end      
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "Logged out!"
  end

end
