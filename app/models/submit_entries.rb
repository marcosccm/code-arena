class SubmitEntries < Struct.new(:entry, :entries, :ui)
  def run
    entry[:content] = Pygments.highlight(entry[:content], lexer: entry[:language].to_s.downcase)
    entries.submit(entry)
    ui.entry_submited
  end
end
