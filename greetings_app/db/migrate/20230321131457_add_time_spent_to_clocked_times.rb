class AddTimeSpentToClockedTimes < ActiveRecord::Migration[7.0]
  def change
    add_column :clocked_times, :time_spent, :integer
  end
end
