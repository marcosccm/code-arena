class SubmitEntries 
  def initialize(entries, ui, builder=EntryBuilder.new)
    @entries = entries
    @ui = ui
    @builder = builder
  end

  def submit(entry_params, user)
    entry = @builder.build(entry_params.merge(author: user))
    @entries.submit(entry)
    @ui.entry_submited
  end
end
