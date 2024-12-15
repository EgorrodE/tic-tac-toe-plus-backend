class CreateGameSessionsMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions_moves do |t|
      t.belongs_to :game_sessions_player, foreign_key: true, null: false
      t.belongs_to :game_sessions_session, foreign_key: true, null: false
      t.belongs_to :game_sessions_field, foreign_key: true, null: false

      t.integer :value, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
