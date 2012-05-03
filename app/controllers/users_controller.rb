class UsersController < ApplicationController
  respond_to :html, :json
  #
  # Filters
  #
  before_filter :require_login
  skip_before_filter :require_login, :only => [:new, :create]

  #
  # Decent exposure
  #
  expose(:users) { User.all }
  expose(:user)

  def new
    respond_with user
  end

  def edit
    respond_with user
  end

  def create
    if user.save
      auto_login user
      flash[:notice] = "User was created successfully."
    end
    respond_with user, location: root_url
  end

  def update
    flash[:notice] = "User was created updated." if user.save
    respond_with user
  end

  # def index
  #   @users = User.all

  #   respond_to do |format|
  #     format.html
  #     format.json { render json: @users }
  #   end
  # end

  # def show
  #   @user = User.find(params[:id])

  #   respond_to do |format|
  #     format.html
  #     format.json { render json: @user }
  #   end
  # end

  # def new
  #   @user = User.new

  #   respond_to do |format|
  #     format.html
  #     format.json { render json: @user }
  #   end
  # end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def create
  #   @user = User.new(params[:user])

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render json: @user, status: :created, location: @user }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   @user = User.find(params[:id])

  #   respond_to do |format|
  #     if @user.update_attributes(params[:user])
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy

  #   respond_to do |format|
  #     format.html { redirect_to users_url }
  #     format.json { head :no_content }
  #   end
  # end
end
