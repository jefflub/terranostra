class AddDurationToSlideshows < ActiveRecord::Migration[5.2]
  def change
    add_column :slideshows, :duration, :integer, null: false, default: 0
  end
end
