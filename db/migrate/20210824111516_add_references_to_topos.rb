class AddReferencesToTopos < ActiveRecord::Migration[6.0]
  def change
    add_reference :topos, :river, foreign_key: true
    add_reference :topos, :departure, foreign_key: { to_table: :addresses }
    add_reference :topos, :arrival, foreign_key: { to_table: :addresses }
  end
end
