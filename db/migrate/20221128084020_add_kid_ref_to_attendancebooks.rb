class AddKidRefToAttendancebooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendancebooks, :kid, null: false, foreign_key: true
  end
end
