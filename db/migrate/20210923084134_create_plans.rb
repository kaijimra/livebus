class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.references :bus, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true
      t.time :arrv_time
      t.time :dept_time

      t.timestamps
    end
  end
end
