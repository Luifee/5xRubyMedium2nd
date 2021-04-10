class AddDeletedAtToMemo < ActiveRecord::Migration[6.1]
  def change
    add_column :memos, :deleted_at, :datetime
    add_index :memos, :deleted_at
  end
end
