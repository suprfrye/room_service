class CreateAppointments < ActiveRecord::Migration
  def change
      create_table :appointments do |t|
        t.belongs_to :room
        t.belongs_to :group
        t.datetime :start_datetime, null: false
        t.datetime :end_datetime, null: false

        t.timestamps
    end
  end
end
