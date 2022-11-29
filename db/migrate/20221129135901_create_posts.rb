class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.date "day"
      t.text "remark"
      t.timestamps
    end
  end
end
