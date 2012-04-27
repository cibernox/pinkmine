describe Project do
  let(:saved_project){ Project.create }
  
  #
  # Relations
  #
  it { should belong_to :creator }
  it { should have_many :issues  }
  # it { should have_many :contributors }
  # it { should have_many :branchs }

  #
  # Validations
  #
  describe 'Validations' do
    # name
    it { should validate_presence_of :name }
  end
  #
  # Instance methods
  #
  it '#highest_code should return the highest code among its issues, or 0 if none' do
    saved_project.highest_code.should == '0'
    saved_project.issues.should_receive(:maximum).with(:code).and_return('5')
    saved_project.highest_code.should == '5'
  end

end