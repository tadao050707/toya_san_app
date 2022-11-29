class RemoveRemarkFromAttendancebooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendancebooks, :remark, :text
  end
end
