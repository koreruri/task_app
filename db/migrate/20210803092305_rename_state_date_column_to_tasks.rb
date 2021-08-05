class RenameStateDateColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :state_date, :start_date
  end
end
