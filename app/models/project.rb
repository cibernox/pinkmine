# -*- encoding : utf-8 -*-
class Project < ActiveRecord::Base
  attr_accessible :name
  include WithResponsable
  include WithCreator

  #
  # Relations
  #
  has_many :issues, order: 'code DESC'

  #
  # Validations
  #
  validates :name, presence: true

  #
  # Instance methods
  #
  def highest_code
    issues.maximum(:code) || '0'
  end

end
