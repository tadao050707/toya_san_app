class CreateAttendancebooks < ActiveRecord::Migration[6.1]
  def change
    create_table :attendancebooks do |t|
      t.date "day"
      t.integer "presence_or_absence"
      t.text "remark"

      t.timestamps
    end
  end
end
