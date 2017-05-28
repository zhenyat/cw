class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name,     null: false
      t.string :title,    null: false
      t.integer :position
      t.integer :status,  null: false, default: 0, limit: 1  # default: active

      t.timestamps
    end
  end
end
