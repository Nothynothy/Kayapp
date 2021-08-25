class ChangeLengthTypeToTopos < ActiveRecord::Migration[6.0]
  def change
    change_column :topos, :length, :string
  end
end
