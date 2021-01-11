class RemoveClipNameFromExamples < ActiveRecord::Migration[6.0]
  def change
    remove_column :examples, :clip_name, :string
  end
end
