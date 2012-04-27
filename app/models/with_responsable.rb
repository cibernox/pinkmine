module WithResponsable

  def self.included(base)
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