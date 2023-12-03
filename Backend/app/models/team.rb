class Team < ApplicationRecord
  has_many :soccer_players
  
  def match_quatity
    outside_matches = Match.where(team_outside_id: id)
    house_matches   = Match.where(team_house_id: id)

    outside_matches.or(house_matches).count
  end

  def player_quantity
    SoccerPlayer.where(team_id: id).count
  end
end
