class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :role
      t.integer :kind_mask # tycoon / politician / etc. we use mask because a node can have two kinds
      t.string :description

      t.timestamps
    end
    add_index :nodes, :first_name
    add_index :nodes, :last_name
    add_index :nodes, :kind_mask
  end
end
