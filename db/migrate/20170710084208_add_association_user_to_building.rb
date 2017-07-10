class AddAssociationUserToBuilding < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :building
  end
end
