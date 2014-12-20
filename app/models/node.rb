class Node < ActiveRecord::Base

  has_many :node_connections, class_name: 'Connection', foreign_key: :node_id # Note: use 'connections' method!
  has_many :other_node_connections, class_name: 'Connection', foreign_key: :other_node_id # Note: use 'connections' method!

  has_many :affiliations
  has_many :groups, through: :affiliations

  attr_accessible :first_name, :last_name, :role, :description, :kind_mask

  validates_presence_of :first_name, message: "Mandatory field"
  validates_presence_of :last_name, message: "Mandatory field"

  scope :ordered, order('last_name asc')

  def connections
    node_connections + other_node_connections
  end

end
