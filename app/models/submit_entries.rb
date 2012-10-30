class SubmitEntries < Struct.new(:entry, :entries, :ui)
  def run
    entries.submit(entry['title'])
    ui.entry_submited
  end
end
