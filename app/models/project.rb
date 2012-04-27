class Project < ActiveRecord::Base
  attr_accessible :name

  #
  # Relations
  #
  belongs_to :creator, class_name: 'User'
  has_many :issues


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
