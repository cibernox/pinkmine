describe User do
  
  #
  # Relations
  #
  it { should have_many :created_projects }
  it { should have_many :created_issues   }

  #
  # Callbacks
  #
  describe 'Callbacks' do
  end

  #
  # Validations
  #
  describe 'Validations' do
    # login
    it { should validate_presence_of :login }
    it "should validate that the login has between 5 and 20 chars" do
      subject.should_not allow_value('aaaa').for(:login)
      subject.should allow_value('aaaaa').for(:login)
      subject.should_not allow_value('aaaaaaaaaaaaaaaaaaaaa').for(:login)
    end
    # password
    it "should validate that the password has between 5 and 20 chars" do
      subject.should_not allow_value('aaaa').for(:password)
      subject.should allow_value('aaaaa').for(:password)
      subject.should_not allow_value('aaaaaaaaaaaaaaaaaaaaa').for(:password)
    end
  end

  #
  # Instance methods
  #

end
