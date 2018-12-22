class ModifySlideColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :slides, :duration
    rename_column :slides, :notes, :title
    add_column :slides, :notes, :text
  end
end
