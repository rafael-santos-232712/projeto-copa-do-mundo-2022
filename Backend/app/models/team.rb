class Team < ApplicationRecord
  has_many :soccer_players, dependent: :destroy
  has_many :house_matches, class_name: 'Match', foreign_key: :team_house_id, dependent: :destroy
  has_many :outside_matches, class_name: 'Match', foreign_key: :team_outside_id, dependent: :destroy
  
  def match_quatity
    outside_matches = Match.where(team_outside_id: id)
    house_matches   = Match.where(team_house_id: id)

    outside_matches.or(house_matches).count
  end

  def player_quantity
    SoccerPlayer.where(team_id: id).count
  end
end
