class Limit
  def self.maximum_prize_limit?(event)
    event.awards.count >= 3
  end
end