class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :email_address, null: false, limit: 50
      t.string :password, null: false, limit: 15
      t.string :position, null: false, limit: 20, default: "Student"
      t.timestamps
    end
  end
end
