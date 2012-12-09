class SubmitEntries < Struct.new(:entry, :entries, :ui)
  def run
    entries.submit(entry)
    ui.entry_submited
  end
end
