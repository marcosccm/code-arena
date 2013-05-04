require_relative '../../app/models/submit_entries'

describe SubmitEntries do
  let(:entries)      { stub(:entries, :submit => nil) }
  let(:ui)           { stub(:ui, :entry_submited => nil) }
  let(:builder)      { stub(:builder) }
  let(:entry)        { stub(:entry) }
  let(:author)       { stub(:author) }
  let(:params)       { { 'title' => 'desafiadora' } }

  subject(:submitter) { SubmitEntries.new(entries, ui, builder) }

  context 'with a valid entry' do
    it 'builds the entry with the author' do
      builder.should_receive(:build).with(params.merge(author: author)).and_return(entry)
      submitter.submit(params, author)
    end

    it 'submits the entry' do
      builder.stub(:build).and_return(entry)
      entries.should_receive(:submit).with(entry)
      submitter.submit(params, author)
    end

    it 'updates the ui with sucess case' do
      builder.stub(:build)
      ui.should_receive(:entry_submited) 
      submitter.submit(params, author)
    end
  end
end
