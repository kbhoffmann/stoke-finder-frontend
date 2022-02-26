class CreateUserAdventure < ActiveRecord::Migration[5.2]
  def change
    create_table :user_adventures do |t|
      t.bigint :user_id
      t.bigint :adventure_id
      t.index [:adventure_id], name: "index_user_adventures_on_adventure_id"
      t.index [:user_id], name: "index_user_adventures_on_user_id"

      t.timestamps
    end
  end
end
