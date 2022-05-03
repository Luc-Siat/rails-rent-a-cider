class AddPriceToCider < ActiveRecord::Migration[6.1]
  def change
    add_column :ciders, :price, :float
  end
end
