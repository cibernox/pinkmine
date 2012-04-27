describe Issue do
  
  #
  # Relations
  #
  it { should belong_to :project }
  it { should belong_to :responsable }
  # it { should belong_to :branch }

  #
  # Callbacks
  #
  describe 'Callbacks' do
    it '#before_validation should set the code to the next one' do
      subject.should_receive(:set_next_code).once
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
  end

  #
  # Instance methods
  #
  describe '#initialize_to_next_code' do
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

end