class AnimUrlCreate < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :url, null: false
      t.string :animurl, null: false

      t.timestamps null: false
    end

    create_table :adjectives do |t|
      t.string :adjective, null: false
      t.string :type, null: false

      t.timestamps null: false
    end

    create_table :animals do |t|
      t.string :animal, null: false

      t.timestamps null: false
    end
  end
end
