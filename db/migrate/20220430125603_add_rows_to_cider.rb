class AddRowsToCider < ActiveRecord::Migration[6.1]
  def change
    add_column :ciders, :name, :string
    add_column :ciders, :region, :string
    add_column :ciders, :flavor, :string
    add_column :ciders, :alcohol_level, :integer
  end
end
