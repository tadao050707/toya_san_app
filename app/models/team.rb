class Team < ApplicationRecord
  has_many :kids, dependent: :destroy, inverse_of: :team
  accepts_nested_attributes_for :kids, allow_destroy: true, reject_if: :all_blank
end
