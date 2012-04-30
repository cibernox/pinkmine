shared_examples_for "an object with creator" do
  #
  # Relations
  #
  it { should belong_to :creator }
  

  #
  # Validations
  #
  it { should validate_presence_of :creator }

  #
  # Instance methods
  #
  it 'should be created by an user if that user is its creator' do
    user = User.new username: 'Miguel'
    subject.creator = user
    subject.should be_created_by user
  end

end