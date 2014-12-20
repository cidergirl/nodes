class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :node_id, :null => false
      t.integer :other_node_id, :null => false
      t.integer :kind_mask # family / business associate / etc. we use a mask because two nodes can be connected in more than one way

      t.timestamps
    end
    add_index :connections, [:node_id, :other_node_id], :unique => true
    add_index :connections, [:other_node_id, :node_id]
  end
end
