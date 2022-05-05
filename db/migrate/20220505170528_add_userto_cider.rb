class AddUsertoCider < ActiveRecord::Migration[6.1]
  def change
    add_reference :ciders, :user, foreign_key: true
  end
end
