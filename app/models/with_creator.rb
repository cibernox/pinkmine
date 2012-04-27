module WithCreator

  def self.included(base)
    #
    # Relations
    #
    base.belongs_to :creator, class_name: 'User'

    #
    # Validations
    #
    base.validates :creator, presence: true
  end

  #
  # Instance metods
  #
  def created_by?(usr)
    creator == usr
  end

end