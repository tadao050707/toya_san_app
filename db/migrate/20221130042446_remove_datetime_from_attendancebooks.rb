class RemoveDatetimeFromAttendancebooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendancebooks, :datetime, :date
  end
end
