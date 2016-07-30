class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :last_seen_at
      t.integer :web_sessions, :default => 0
      t.references :app, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
