class AddDecidedAtToSplits < ActiveRecord::Migration[5.0]
  def change
    add_column :splits, :decided_at, :datetime
  end
end
