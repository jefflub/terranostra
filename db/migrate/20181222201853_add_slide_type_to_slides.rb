class AddSlideTypeToSlides < ActiveRecord::Migration[5.2]
  def change
    add_column :slides, :slide_type, :integer, null: false, default: 0
  end
end
