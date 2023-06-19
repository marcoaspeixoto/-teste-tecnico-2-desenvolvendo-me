class Event < ApplicationRecord
  has_many :awards
  has_many :participations
  has_many :users, through: :participations
end
