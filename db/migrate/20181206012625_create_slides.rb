class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.integer :start_time
      t.integer :duration
      t.text :notes

      t.timestamps
    end
  end
end
