# -*- encoding : utf-8 -*-
describe ApplicationHelper do

  describe '#link_to' do
    it 'accepts an :icon option that outputs an icon class attribute' do
      link_to('Nowhere', '/route', icon: 'user').should have_tag('a i.icon-user')
    end
  end

  describe '#default_text_for_bootstrap_alert' do
    it "should have default texts for notice and success alerts" do
      helper.default_text_for_bootstrap_alert(:success).should == '<strong>Listo!</strong> Se han actualizado los datos'
      helper.default_text_for_bootstrap_alert('error').should == '<strong>Oh oh!</strong> Parece que hay algún dato erróneo'
      helper.default_text_for_bootstrap_alert(:other_thing).should be_nil
    end
  end

  describe '#bootstrap_alert' do
    let(:alert) { helper.bootstrap_alert(received_text, :success) }
    context 'when it dont receives any text' do
      let(:received_text) { nil }
      it 'should render a boostrap-styled alerts, fetching for a default text for that kind of alert' do
        alert.should have_tag('.alert.alert-success') { with_tag('button.close') }
        alert.should =~ /Se han actualizado los datos/
      end
    end
    context 'when it receives a text' do
      let(:received_text) { 'Alert de prueba' }
      it 'should render a boostrap-styled alerts with that text' do
        alert.should have_tag('.alert.alert-success') { with_tag('button.close') }
        alert.should =~ /Alert de prueba/
      end
    end
  end

  describe '#bootstrap_flashes' do
    let(:flashes){ helper.bootstrap_flashes }
    it "should display an alert for each kind of flash entry" do
      flash[:notice] = "Flash notice"
      flash[:success] = "Flash success"
      flash[:error] = "Flash explaining error"
      flashes.should have_tag('.alert.alert-info', text: 'Flash notice')
      flashes.should have_tag('.alert.alert-success', text: 'Flash success')
      flashes.should have_tag('.alert.alert-error', text: 'Flash explaining error')
    end
  end

  describe '#flash_class' do
    it "should return the proper bootstrap class for the alert" do
      helper.flash_class(:notice).should == 'alert-info'
      helper.flash_class(:alert).should == 'alert-warning'
      helper.flash_class('error').should == 'alert-error'
    end
  end

end