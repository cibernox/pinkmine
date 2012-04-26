class Project < ActiveRecord::Base
  attr_accessible :name

  #
  # Relations
  #
  has_many :issues

end
