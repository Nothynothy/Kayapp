class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.integer :difficulty
      t.references :topo, foreign_key: true

      t.timestamps
    end
  end
end
