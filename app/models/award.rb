class Award < ApplicationRecord
  belongs_to :event
  validates :prize_limit

  private

  def prize_limit
    errors.add(:base, "O evento já atingiu o limite máximo de prêmios (3).") if award.maximum_prize_limit?(event)
  end
end
