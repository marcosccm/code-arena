require_relative '../../app/models/syntax_highlighter'

describe SyntaxHighlighter do
  let(:engine) { stub }
  let(:entry) do
    stub('entry', :language => 'ruby', :content => 'content')
  end

  subject(:highlighter) { SyntaxHighlighter.new(engine) }

  it 'highlights content' do
    engine.should_receive(:highlight).and_return('highlighted')
    entry.should_receive(:add_highlight).with('highlighted')

    highlighter.highlight(entry)
  end
end
