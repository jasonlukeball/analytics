class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :url
      t.string :name
      t.string :id_code
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
