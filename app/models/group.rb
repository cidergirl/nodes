class Group < ActiveRecord::Base
  has_many :affiliations
  has_many :nodes, through: :affiliations
end
