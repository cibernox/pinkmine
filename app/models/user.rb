class User < ActiveRecord::Base
  attr_accessible :login, :password
  
  #
  # Relations
  #
  has_many :created_projects, class_name: 'Project', foreign_key: 'creator_id'
  has_many :created_issues, class_name: 'Issue', foreign_key: 'creator_id'

  #
  # Validations
  #
  validates :login, presence: true, length: 5..20
  validates :password, confirmation: true, length: 5..20

  #
  # Métodos de instancia
  #

end
