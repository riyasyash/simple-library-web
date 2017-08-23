class AddColumnsToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :isbn, :string
    add_column :books, :total_count, :integer
    add_column :books, :available, :integer
  end
end
