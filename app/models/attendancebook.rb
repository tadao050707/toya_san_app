class Attendancebook < ApplicationRecord
  belongs_to :kid
  enum presence_or_absence: { 出席: 0, 欠席: 1 }
end
