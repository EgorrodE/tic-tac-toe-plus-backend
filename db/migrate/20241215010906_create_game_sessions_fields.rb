class CreateGameSessionsFields < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions_fields do |t|
      t.belongs_to :game_sessions_game_row

      t.integer :position, null: false
      t.integer :value, null: false, default: 0

      t.timestamps
    end
  end
end
