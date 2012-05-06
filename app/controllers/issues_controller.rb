# -*- encoding : utf-8 -*-
class IssuesController < ApplicationController
  respond_to :html, :json
  
  #
  # Decent exposure
  #
  expose(:project) { Project.find(params[:project_id]) }
  expose(:issues) { project.issues }
  expose(:issue)

 def index
    respond_with issues
  end

  def show
    respond_with issue
  end

  def new
    respond_with issue
  end

  def edit
    respond_with issue
  end

  def create
    issue.save
    respond_with issue
  end

  def update
    issue.save
    respond_with issue
  end

  def destroy
    issue.destroy
    respond_with issue
  end
end
