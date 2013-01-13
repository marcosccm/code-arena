require_relative '../../app/models/challenge_entries'
require_relative '../../app/models/entry_builder'

describe EntryBuilder do
  let(:params) { stub }
  let(:entry)  { stub }
  let(:factory)  { stub }
  let(:highlighter)  { stub('syntax highlighter', :highlight => nil) }

  subject(:builder) { EntryBuilder.new(factory, highlighter) } 

  context 'building challenge entries' do
    it 'creates the challenge entries' do
      factory.should_receive(:new).and_return(entry)
      builder.build(params).should == entry
    end

    it 'adds highlighted code to the entry' do
      factory.should_receive(:new).and_return(entry)
      highlighter.should_receive(:highlight).and_return(entry)
      builder.build(params)
    end
  end
end

