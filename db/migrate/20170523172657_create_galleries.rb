class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string  :name,   null: false
      t.string  :title,  null: false
      t.string  :images
      t.integer :position
      t.integer :status,  null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
