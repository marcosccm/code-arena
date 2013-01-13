require 'pygments'
class SyntaxHighlighter
  def initialize(engine=Pygments)
    @engine = engine
  end

  def highlight(entry)
    entry.add_highlight highlighted_code_for entry
  end
  
  private
  def highlighted_code_for(entry)
    lexer = entry.language
    @engine.highlight(entry.content, lexer: lexer.downcase)
  end
end
