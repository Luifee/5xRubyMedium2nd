class AddSlugToMemo < ActiveRecord::Migration[6.1]
  def change
    add_column :memos, :slug, :string
    add_index :memos, :slug, unique: true
  end
end
