class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string  :post_code,          null: false
      t.integer :origin_id,          null: false
      t.string  :city,               null: false
      t.string  :area_number,        null: false
      t.string  :building,           
      t.string  :phone,              null: false
      t.references :purchase,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
