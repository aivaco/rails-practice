class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.timestamp :created_at
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
