class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.references :plant, foreign_key: true
      t.string  :title,    null: false
      t.text    :content
      t.string  :photo
      t.integer :position
      t.integer :status,  null: false, default: 0, limit: 1  # default: active

      t.timestamps
    end
  end
end
