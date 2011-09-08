require 'spec_helper'

describe Guard::CoffeeScript::Inspector do
  before do
    Dir.stub(:glob).and_return 'a.coffee'
  end

  let(:inspector) { Guard::CoffeeScript::Inspector }

  describe 'clean' do
    it 'removes duplicate files' do
      inspector.clean(['a.coffee', 'a.coffee']).should == ['a.coffee']
    end

    it 'remove nil files' do
      inspector.clean(['a.coffee', nil]).should == ['a.coffee']
    end

    it 'removes non-coffee files' do
      inspector.clean(['a.coffee', 'b.txt']).should == ['a.coffee']
    end

    it 'frees up the list of coffee script files' do
      inspector.should_receive(:clear_coffee_files_list)
      inspector.clean(['a.coffee'])
    end

  end
end
