json.extract! team, :id, :name, :match_quatity, :victories, :loses, :created_at, :updated_at, :player_quantity
json.url team_url(team, format: :json)
