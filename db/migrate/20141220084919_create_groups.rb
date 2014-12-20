class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :null => false
      t.string :kind_mask # corporation / family / etc. we use mask because a group can have two kinds
      t.string :description

      t.timestamps
    end
    add_index :groups, :name, :unique => true
    add_index :groups, :kind_mask
  end
end
