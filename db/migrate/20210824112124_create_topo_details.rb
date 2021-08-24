class CreateTopoDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :topo_details do |t|
      t.string :category
      t.string :content
      t.references :topo, foreign_key: true

      t.timestamps
    end
  end
end
