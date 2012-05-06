# -*- encoding : utf-8 -*-
require 'spec_helper'

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
    it { should validate_presence_of :username }
    it "should validate that the username has between 5 and 20 chars" do
      subject.should_not allow_value('aaaa').for(:username)
      subject.should allow_value('aaaaa').for(:username)
      subject.should_not allow_value('aaaaaaaaaaaaaaaaaaaaa').for(:username)
    end
    it "should validate that the user accepts the conditions of the service" do
      subject.should allow_value(true).for(:accepts_conditions)
      subject.should_not allow_value(false).for(:accepts_conditions)
    end
  end

  #
  # Instance methods
  #

end
