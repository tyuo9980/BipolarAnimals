class Urlfix < ActiveRecord::Migration
  def up
    change_column :urls, :url, :string
  end

  def down
    change_column :urls, :url, :text
  end
end
