class CreateSoccerPlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :soccer_players do |t|
      t.string :name
      t.integer :number
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
