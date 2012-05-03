# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username, :email, :password, :password_confirmation, :name, :surname1, :surname2, :twitter,
    :github

  #
  # Relations
  #
  has_many :created_projects, class_name: 'Project', foreign_key: 'creator_id'
  has_many :created_issues,   class_name: 'Issue',   foreign_key: 'creator_id'

  #
  # Validations
  #
  validates :username, presence: true, uniqueness: true, length: 5..20
  validates :email,    presence: true, uniqueness: true, email: true
  validates :password, presence: { on: :create }, confirmation: true, length: { in: 5..20, on: :create }

  #
  # Métodos de instancia
  #
  def to_s
    username
  end
end
