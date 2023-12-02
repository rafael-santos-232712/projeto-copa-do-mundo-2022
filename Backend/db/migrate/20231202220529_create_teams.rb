class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :victories
      t.integer :loses

      t.timestamps
    end
  end
end
