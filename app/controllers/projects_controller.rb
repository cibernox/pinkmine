# -*- encoding : utf-8 -*-
class ProjectsController < ApplicationController
  respond_to :html, :json

  #
  # Filters
  #
  before_filter :require_login

  #
  # Decent exposure
  #
  expose(:projects) { Project.all }
  expose(:project)

  def index
    respond_with projects
  end

  def show
    respond_with project
  end

  def new
    respond_with project
  end

  def edit
    respond_with project
  end

  def create
    project.save
    respond_with project
  end

  def update
    project.save
    respond_with project
  end

  def destroy
    project.destroy
    respond_with project
  end
end
