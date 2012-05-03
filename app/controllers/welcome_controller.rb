# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  before_filter :redirect_to_welcome_unless_logged, only: :index

  private
  def redirect_to_welcome_unless_logged
    redirect_to welcome_path unless logged_in?
  end
end
