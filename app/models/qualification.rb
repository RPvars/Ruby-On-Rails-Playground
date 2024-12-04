class Qualification < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :acquired_date, presence: true
  validate :valid_until_after_acquired_date

  private

  def valid_until_after_acquired_date
    return if valid_until.blank? || acquired_date.blank?

    if valid_until < acquired_date
      errors.add(:valid_until, "nevar būt pirms iegūšanas datuma")
    end
  end
end