class CreateCustomRecArea < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_rec_areas do |t|
      t.string :name
      t.string :longitude
      t.string :latitude
      t.string :activities
      t.text :comments
      t.bigint :user_id
      t.index ["user_id"], name: "index_custom_rec_areas_on_user_id"

      t.timestamps
    end
  end
end
