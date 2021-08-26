class DropLevelToTopos < ActiveRecord::Migration[6.0]
  def change
    remove_column :topos, :level
  end
end
