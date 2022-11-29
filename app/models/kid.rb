class Kid < ApplicationRecord
  belongs_to :team, inverse_of: :kids
  has_many :attendancebooks, dependent: :destroy
end
