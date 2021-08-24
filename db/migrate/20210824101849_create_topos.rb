class CreateTopos < ActiveRecord::Migration[6.0]
  def change
    create_table :topos do |t|
      t.string :name
      t.integer :level
      t.integer :length

      t.timestamps
    end
  end
end
