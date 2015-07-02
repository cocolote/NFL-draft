class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :avatar
      t.integer :team_id
      t.integer :position_id, null: false

      t.timestamps null:false
    end
    add_index :players, :name
  end
end
