class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password
      t.integer :access
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :activity_preference

      t.timestamps
    end
  end
end
