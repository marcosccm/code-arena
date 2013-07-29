require_relative '../../app/models/submit_entries'

describe SubmitEntries do
  let(:entries)      { double(:entries, :submit => nil) }
  let(:ui)           { double(:ui, :entry_submited => nil) }
  let(:builder)      { double(:builder, build: entry) }
  let(:entry)        { double(:entry, :associate_challenge => nil) }
  let(:author)       { double(:author) }
  let(:challenge)    { double }
  let(:params)       { { 'title' => 'desafiadora' } }

  subject(:submitter) { SubmitEntries.new(entries, ui, builder) }

  context 'with a valid entry' do
    it 'builds the entry with the author' do
      paramsWithAuthor = params.merge(author: author)
      expect(builder).to receive(:build).with(paramsWithAuthor).and_return(entry)
      submitter.submit(params, author, challenge)
    end

    it 'sets the entry challenge id' do
      expect(entry).to receive(:associate_challenge).with(challenge)
      submitter.submit(params, author, challenge)
    end

    it 'submits the entry' do
      expect(entries).to receive(:submit).with(entry)
      submitter.submit(params, author, challenge)
    end

    it 'updates the ui with sucess case' do
      expect(ui).to receive(:entry_submited) 
      submitter.submit(params, author, challenge)
    end
  end
end
