class Issue < ActiveRecord::Base
  # attr_accessible :title, :body

  #
  # Callbacks
  #
  def after_initialize
    self.code ||= (project.issues.maximum(:code) || 0).succ
  end

end
