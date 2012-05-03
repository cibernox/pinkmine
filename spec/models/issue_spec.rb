# -*- encoding : utf-8 -*-
describe Issue do

  it_behaves_like "an object with responsable"
  it_behaves_like "an object with creator"

  #
  # Factories
  #
  let(:user){ create :user }
  let(:project){ create :project, creator: user }

  #
  # Relations
  #
  it { should belong_to :project }

  #
  # Scopes
  #
  describe 'Scopes' do
    it '#open should return any issue not closed nor rejected' do
      closed_issue = create :issue, creator: user, project: project, status: 'closed'
      rejected_issue = create :issue, creator: user, project: project, status: 'rejected'
      open_issues = project.issues.opened
      open_issues.should_not include(closed_issue)
      open_issues.should_not include(rejected_issue)
    end
  end

  #
  # Callbacks
  #
  describe 'Callbacks' do
    it '#before_validation should set the code to the next one and initialize the percentage' do
      subject.should_receive(:set_next_code).once
      subject.should_receive(:initialize_percentage).once
      subject.valid?
    end
  end

  #
  # Validations
  #
  describe 'Validations' do
    # title
    it { should validate_presence_of :title }
    # code
    it { should validate_numericality_of :code }
    it "should validate that code is positive" do
      subject.should allow_value('10').for(:code)
      subject.should_not allow_value('0').for(:code)
    end
    # project
    it { should validate_presence_of :project }
    # status
    it "should validate that the state is one of the list of valid statates" do
      subject.class::VALID_STATUS.each { |status| subject.should allow_value(status).for(:status) }
      subject.should_not allow_value('abcd').for(:status)
    end
    # Percentage
    it { should ensure_inclusion_of(:percentage).in_range(0..100) }
  end

  #
  # Instance methods
  #
  describe '#set_next_code' do
    let(:project) { Project.new }
    it "should init its code to one if it dont has project" do
      expect { subject.send :set_next_code }.to change(subject, :code).from(nil).to('1')
    end
    it "should init its code to one if its project doesn't have issues yet" do
      subject.project = project
      expect { subject.send :set_next_code }.to change(subject, :code).from(nil).to('1')
    end
    it "should not change its code if it already has one" do
      subject.code = '5'
      expect { subject.send :set_next_code }.not_to change(subject, :code)
    end
    it 'should init its code to the successor of the highest code among the issues of its project' do
      project.stub highest_code: '10'
      subject.project = project
      expect { subject.send :set_next_code }.to change(subject, :code).from(nil).to('11')
    end
  end
  it '#initialize_percentage' do
    expect { subject.send :initialize_percentage }.to change(subject, :percentage).from(nil).to(0)
  end

  it '#opened? should be true unless the status is closed or rejected' do
    subject.status = 'resolved'
    subject.should be_opened
    subject.status = 'closed'
    subject.should_not be_opened
    subject.status = 'rejected'
    subject.should_not be_opened
  end

end
