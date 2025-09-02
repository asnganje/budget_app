class AddGroupToOperation < ActiveRecord::Migration[8.0]
  def change
    add_reference :operations, :group, null: false, foreign_key: true
  end
end
