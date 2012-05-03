# -*- encoding : utf-8 -*-
describe Project do
  let(:saved_project){ Project.create }
  
  it_behaves_like "an object with responsable"
  it_behaves_like "an object with creator"
  
  #
  # Relations
  #
  it { should have_many :issues }

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
