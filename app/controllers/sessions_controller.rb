# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  layout 'login'
  
  #
  # Filters
  #
  skip_before_filter :require_login, :except => [:destroy]

  def new
  end

  def create
    @user = login(params[:username], params[:password], params[:remember_me])
    respond_to do |format|
      format.html do
        if @user
          redirect_back_or_to root_url, notice: "Logged in!"
        else
          flash.now.alert = "Email or password was invalid."
          render :new
        end
      end
      format.js { flash[:success] = "Login correct" }
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "Logged out!"
  end

end
