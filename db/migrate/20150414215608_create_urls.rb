class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
