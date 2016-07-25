class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :app, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
