class Issue < ActiveRecord::Base
  attr_accessible :title, :code, :desciption, :project, :status, :percentage

  #
  # Relations
  #
  belongs_to :project

  #
  # Callbacks
  #
  def after_initialize
    self.code ||= (project.issues.maximum(:code) || 0).succ
  end

end
