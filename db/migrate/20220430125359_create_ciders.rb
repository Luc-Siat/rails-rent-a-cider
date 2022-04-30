class CreateCiders < ActiveRecord::Migration[6.1]
  def change
    create_table :ciders do |t|

      t.timestamps
    end
  end
end
