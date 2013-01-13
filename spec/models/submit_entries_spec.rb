require_relative '../../app/models/submit_entries'

describe SubmitEntries do
  let(:entries)      { stub(:entries, :submit => nil) }
  let(:ui)           { stub(:ui, :entry_submited => nil) }
  let(:builder)      { stub(:builder) }
  let(:entry)        { stub(:entry) }
  let(:params)       { { 'title' => 'desafiadora' } }

  subject(:submitter) { SubmitEntries.new(entries, ui, builder) }

  context 'with a valid entry' do
    before do
      builder.should_receive(:build).with(params).and_return(entry)
    end

    it 'submits the entry' do
      entries.should_receive(:submit).with(entry)
      submitter.submit(params)
    end

    it 'updates the ui with sucess case' do
      ui.should_receive(:entry_submited) 
      submitter.submit(params)
    end
  end
end
