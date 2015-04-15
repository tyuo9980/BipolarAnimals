class TypeFix < ActiveRecord::Migration
  def up
    rename_column :adjectives, :type, :kind
  end

  def down
    # rename back if you need or do something else or do nothing
  end
end
