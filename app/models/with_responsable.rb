module WithResponsable

  def self.included(base)
    base.attr_accessible :responsable
    #
    # Relations
    #
    base.belongs_to :responsable, class_name: 'User'
  end

  #
  # Instance metods
  #
  def assigned_to?(usr)
    responsable == usr
  end

end