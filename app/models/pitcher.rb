class Pitcher < ApplicationRecord
  def self.most_winners(year)
    pitchers = Pitcher.where(year_id: year)
    max_win = pitchers.maximum(:wins)
    best_pitchers = pitchers.where(wins: max_win)
    best_pitchers.pluck(:player_id)
  end
end
