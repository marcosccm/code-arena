require_relative '../../app/models/submit_entries'

describe SubmitEntries do
  let(:entries) { stub(:entries) }
  let(:ui)      { stub(:ui) }
  let(:entry)   { { 'title' => 'desafiadora' } }

  subject(:submitter) { SubmitEntries.new(entry, entries, ui) }

  context 'with a valid entry' do
    it 'submits the entry' do
      entries.should_receive(:submit).with(entry['title'])
      ui.should_receive(:entry_submited) 
      submitter.run
    end
  end
end
