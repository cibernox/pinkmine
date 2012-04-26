describe Project do
  
  #
  # Relations
  #
  it { should belong_to :creator }
  it { should have_many :issues  }
  it { should have_many :contributors }
  it { should have_many :branchs }

end