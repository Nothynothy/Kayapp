class CreateRivers < ActiveRecord::Migration[6.0]
  def change
    create_table :rivers do |t|
      t.string :name
      t.string :country
      t.string :region
      t.string :department

      t.timestamps
    end
  end
end
