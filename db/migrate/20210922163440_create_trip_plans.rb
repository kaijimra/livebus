class CreateTripPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bus, null: false, foreign_key: true
      t.references :orig_stop, null: false, foreign_key: { to_table: :stops }
      t.references :dest_stop, null: false, foreign_key: { to_table: :stops }
      t.time :sched_dest_time

      t.timestamps
    end
  end
end
