# a non-directed connection
# (two nodes can only have one connection between them,
# it's up to the user to describe the orientation in the text description)
class Connection < ActiveRecord::Base

  belongs_to :node, class_name: 'Node', foreign_key: :node_id
  belongs_to :other_node, class_name: 'Node', foreign_key: :other_node_id

  scope :of_node, lambda{|node_id| where(node_id: node_id).or.where(other_node_id: node_id)} # TODO: needed?
end
