class SubmitEntries 
  def initialize(entries, ui, builder=EntryBuilder.new)
    @entries = entries
    @ui = ui
    @builder = builder
  end

  def submit(entry_params)
    entry = @builder.build(entry_params)
    @entries.submit(entry)
    @ui.entry_submited
  end
end
