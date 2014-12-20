class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.integer :node_id, :null => false
      t.integer :group_id, :null => false

      t.timestamps
    end
    add_index :affiliations, [:node_id, :group_id], :unique => true # to find a node's group
    add_index :affiliations, [:group_id, :node_id] # to find a group's nodes
  end
end
