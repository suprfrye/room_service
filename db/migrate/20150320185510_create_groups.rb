class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :user
      t.string :name, null: false, limit: 50
      t.integer :num_of_people, null: false, default: 1
      t.timestamps
    end
  end
end
