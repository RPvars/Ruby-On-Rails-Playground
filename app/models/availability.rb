class Availability < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :time_slot, presence: true
  validates :user_id, uniqueness: { scope: [:date, :time_slot],
    message: "jau ir pieejamības ieraksts šim datumam un laika slotam" }

  # Enum time_slot vērtībām
  enum time_slot: {
    morning: 'morning',
    afternoon: 'afternoon',
    evening: 'evening'
  }
end