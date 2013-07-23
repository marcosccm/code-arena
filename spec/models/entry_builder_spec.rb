require_relative '../../app/models/challenge_entries'
require_relative '../../app/models/entry_builder'

describe EntryBuilder do
  let(:params) { double }
  let(:entry)  { double }
  let(:factory)  { double }
  let(:highlighter)  { double('syntax highlighter', :highlight => nil) }

  subject(:builder) { EntryBuilder.new(factory, highlighter) } 

  context 'building challenge entries' do
    it 'creates the challenge entries' do
      expect(factory).to receive(:new).and_return(entry)
      builtEntry = builder.build(params)
      expect(builtEntry).to eq(entry)
    end

    it 'adds highlighted code to the entry' do
      expect(factory).to receive(:new).and_return(entry)
      expect(highlighter).to receive(:highlight).and_return(entry)
      builder.build(params)
    end
  end
end

