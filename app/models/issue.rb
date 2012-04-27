class Issue < ActiveRecord::Base
  attr_accessible :title, :code, :desciption, :project, :status, :percentage

  #
  # Relations
  #
  belongs_to :project
  belongs_to :responsable, class_name: 'User'

  #
  # Callbacks
  #
  before_validation :set_next_code

  #
  # Validations
  #
  validates :title,   presence: true
  validates :code,    presence: true, numericality: { greater_than: 0 }
  validates :project, presence: true

  #
  # Instance metods
  #
  private
  def set_next_code
    self.code = project ? project.highest_code.succ : '1' if self.code.blank?
  end

end
