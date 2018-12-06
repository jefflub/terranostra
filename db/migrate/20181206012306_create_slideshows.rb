class CreateSlideshows < ActiveRecord::Migration[5.2]
  def change
    create_table :slideshows do |t|
      t.text :audio_url
      t.boolean :public

      t.timestamps
    end
  end
end
