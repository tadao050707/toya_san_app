class RenameDayColumnToAttendancebooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :attendancebooks, :day, :datetime
  end
end
