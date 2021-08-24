class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :category
      t.boolean :active
      t.string :alert_type
      t.string :description
      t.string :severity
      t.references :user, foreign_key: true
      t.references :topo, foreign_key: true

      t.timestamps
    end
  end
end
