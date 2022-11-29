class Attendancebook < ApplicationRecord
  belongs_to :kid
  enum presence_or_absence: { 出席: 1, 欠席: 0 }
end
