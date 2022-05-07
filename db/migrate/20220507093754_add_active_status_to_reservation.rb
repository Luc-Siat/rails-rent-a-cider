class AddActiveStatusToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :active, :boolean, default: false
  end
end
