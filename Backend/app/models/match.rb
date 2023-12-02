class Match < ApplicationRecord
  belongs_to :team_house, class_name: "Team"
  belongs_to :team_outside, class_name: "Team"
end
