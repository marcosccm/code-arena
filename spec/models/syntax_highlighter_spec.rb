require_relative '../../app/models/syntax_highlighter'

describe SyntaxHighlighter do
  let(:engine) { double }
  let(:entry) do
    double('entry', :language => 'ruby', :content => 'content')
  end

  subject(:highlighter) { SyntaxHighlighter.new(engine) }

  it 'highlights content' do
    expect(engine).to receive(:highlight).and_return('highlighted')
    expect(entry).to receive(:add_highlight).with('highlighted')

    highlighter.highlight(entry)
  end
end
