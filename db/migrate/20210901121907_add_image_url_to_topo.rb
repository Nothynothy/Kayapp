class AddImageUrlToTopo < ActiveRecord::Migration[6.0]
  def change
    add_column :topos, :image_url, :string
  end
end
