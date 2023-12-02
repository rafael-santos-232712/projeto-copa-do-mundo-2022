class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.belongs_to :team_house,   null: false, foreign_key: { to_table: :teams }
      t.belongs_to :team_outside, null: false, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
