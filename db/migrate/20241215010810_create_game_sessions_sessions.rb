class CreateGameSessionsSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions_sessions do |t|
      t.belongs_to :user, foreign_key: true, null: false

      t.string :secret, null: false, unique: true

      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
