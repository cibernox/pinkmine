describe Issue do
  
  #
  # Relations
  #
  it { should belong_to :project }
  it { should belong_to :responsable }
  it { should belong_to :branch }

  #
  # Callbacks
  #
  describe 'Callbacks' do
    it "should initialize its code to the next code in the project unless it has one", :focus => true do
      debugger
      project = Project.new.stub issues: [double(code: '009'), double(code: '007')]
      issue = Issue.new project: project
      issue.code.should == '010'
    end
  end

  #
  # Instance methods
  #


end