class CreateSeaLions < ActiveRecord::Migration
  def change
    create_table :sea_lions do |t|
    t.string :name
    t.string :gender
    t.string :race

    t.timestamps
    end
  end
end
