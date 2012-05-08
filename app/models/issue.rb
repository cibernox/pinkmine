# -*- encoding : utf-8 -*-
class Issue < ActiveRecord::Base
  attr_accessible :title, :code, :description, :project, :status, :percentage, :priority
  include WithResponsable
  include WithCreator

  #
  # Constants
  #
  VALID_STATUS = %w( unstarted in_progress resolved feedback closed rejected )
  VALID_PRIORITIES = %w( low normal high urgent immediate )

  #
  # Relations
  #
  belongs_to :project

  #
  # Scopes
  #
  VALID_STATUS.each do |status|
    scope :"#{status}", where(status: status)
  end
  scope :opened, where(status: %w( unstarted in_progress resolved feedback ))

  #
  # Callbacks
  #
  before_validation :set_next_code
  before_validation :initialize_percentage

  #
  # Validations
  #
  validates :title,      presence: true
  validates :code,       presence: true, numericality: { greater_than: 0 }
  validates :project,    presence: true
  validates :status,     inclusion: { in: VALID_STATUS }
  validates :priority,   inclusion: { in: VALID_PRIORITIES }
  validates :percentage, inclusion: { in: 0..100 }
  
  #
  # Instance metods
  #
  VALID_STATUS.each do |status|
    define_method("#{status}?") do
      self.status == status
    end
  end

  VALID_PRIORITIES.each do |priority|
    define_method("#{priority}?") do
      self.priority == priority
    end
  end

  def opened?
    %w( unstarted in_progress resolved feedback ).include?(status)
  end

  private
  def set_next_code
    self.code = project ? project.highest_code.succ : '1' if self.code.blank?
  end

  def initialize_percentage
    self.percentage ||= 0
  end

end
