# -*- encoding : utf-8 -*-
shared_examples_for "an object with responsable" do
  #
  # Relations
  #
  it { should belong_to :responsable }
  
  #
  # Instance methods
  #
  it 'should be assigned to an user if that user is its responsable' do
    user = User.new username: 'Miguel'
    subject.responsable = user
    subject.should be_assigned_to user
  end

end
