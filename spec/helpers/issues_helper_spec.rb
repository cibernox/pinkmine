describe IssuesHelper do

  describe '#issue_progress_bar_class' do
    it "return an class for a progress bar based on a percentage of progress" do
      issue_progress_bar_class(Issue.new(percentage: 0)).should =~ /progress-danger/
      issue_progress_bar_class(Issue.new(percentage: 33)).should =~ /progress-danger/
      issue_progress_bar_class(Issue.new(percentage: 34)).should =~ /progress-warning/
      issue_progress_bar_class(Issue.new(percentage: 66)).should =~ /progress-warning/
      issue_progress_bar_class(Issue.new(percentage: 67)).should =~ /progress-success/
      issue_progress_bar_class(Issue.new(percentage: 99)).should =~ /progress-success/
      issue_progress_bar_class(Issue.new(percentage: 100)).should =~ /progress-info/
    end
    it "should return a class for a active and striped bar if the issue is in progress" do
      html_class = issue_progress_bar_class(Issue.new(percentage: 50, status: 'in_progress'))
      html_class.should =~ /active/
      html_class.should =~ /progress-striped/
      html_class = issue_progress_bar_class(Issue.new(percentage: 50, status: 'done'))
      html_class.should_not =~ /active/
      html_class.should_not =~ /progress-striped/
    end
  end

  describe '#issue_progress_bar' do
    it 'should return a bootstrap-styled progress bar for the given issue' do
      issue = Issue.new percentage: 60
      issue.stub issue_progress_bar_class: 'progress-warning'
      progress_bar = issue_progress_bar(issue)
      progress_bar.should =~ /width: 60%/
      progress_bar.should have_tag('.progress.progress-warning') do
        with_tag('.bar', text: '60%' )
      end
    end
  end

  describe '#issue_status_dropdown' do
    it 'should return a dropdown button for select the status of an issue, with an option for each status' do
      issue = Issue.new status: "in_progress"
      dropdown = issue_status_dropdown(issue)
      dropdown.should have_tag('.btn-group') do
        with_tag('a.btn.dropdown-toggle')
        with_tag('ul.dropdown-menu')
        # As many links as possible status
        with_tag('.dropdown-menu a', count: Issue::VALID_STATUS.size)
        # Only the one of the current status is active
        with_tag('.dropdown-menu a.active', count: 1)
        with_tag('.dropdown-menu a.active[data-status=in_progress]')
      end
    end
  end

  describe '#issue_priority_label' do
    it 'should return a label with the appropiate style for each priority' do
      # Low: gray
      issue_priority_label(Issue.new(priority: 'low')).should have_tag('span.label')
      # Normal: blue
      issue_priority_label(Issue.new(priority: 'normal')).should have_tag('span.label-info')
      # High: yellow
      issue_priority_label(Issue.new(priority: 'high')).should have_tag('span.label-warning')
      # Urgent: red
      issue_priority_label(Issue.new(priority: 'urgent')).should have_tag('span.label-danger')
      # Immediate: black
      issue_priority_label(Issue.new(priority: 'immediate')).should have_tag('span.label-inverse')
    end
  end

end