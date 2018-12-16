class AddTitleToSlideshow < ActiveRecord::Migration[5.2]
  def change
    add_column :slideshows, :title, :text
  end
end
