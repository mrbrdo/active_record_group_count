require 'spec_helper'

def create(attrs)
  TestModel.new.tap do |model|
    model.assign_attributes(attrs, without_protection: true)
    model.save
  end
end

describe ActiveRecordGroupCount::Scope do
  before do
    5.times { |i| create group_id: 1, value: i }
    3.times { |i| create group_id: 2, value: i }
  end

  let(:scope) { TestModel.group(:group_id) }

  it { scope.count.class.should == ActiveSupport::OrderedHash }
  it { scope.count[1].should == 5 }
  it { scope.count[2].should == 3 }
  it { scope.pluck('MAX(value)').should == [4, 2] }

  it { scope.returns_count_sum.count.should == 2 }
end
