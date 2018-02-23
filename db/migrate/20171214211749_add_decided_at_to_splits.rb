class AddDecidedAtToSplits < ActiveRecord::Migration[5.0]
  def change
    add_column :splits, :decided_at, :datetime
    add_column :splits, :deciding_admin_id, :integer, foreign_key: true
    add_column :splits, :deciding_variant, :string
  end
end
