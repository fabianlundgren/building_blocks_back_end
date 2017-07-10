class AddAssociationUserToBuilding < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :building, foreign_key: true
  end
end
