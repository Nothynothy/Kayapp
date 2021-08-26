class DropTopoDetails < ActiveRecord::Migration[6.0]
  def change
    drop_table :topo_details
  end
end
