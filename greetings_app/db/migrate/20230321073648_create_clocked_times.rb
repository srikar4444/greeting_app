class CreateClockedTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :clocked_times do |t|
      t.datetime :time
      t.string :action
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
