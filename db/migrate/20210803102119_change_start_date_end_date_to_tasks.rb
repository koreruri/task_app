class ChangeStartDateEndDateToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :start_date, :datetime
    change_column :tasks, :end_date, :datetime
  end
end
