class AddTeamRefToKids < ActiveRecord::Migration[6.1]
  def change
    add_reference :kids, :team, foreign_key: true
  end
end
