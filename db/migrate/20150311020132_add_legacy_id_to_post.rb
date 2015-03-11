class AddLegacyIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :legacy_id, :integer
  end
end
