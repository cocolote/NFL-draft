class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :round, null: false
      t.integer :turn, null: false
      t.integer :team_id, null: false
      t.boolean :used, default: false

      t.timestamps null: false
    end
  end
end
