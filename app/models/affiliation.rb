class Affiliation < ActiveRecord::Base
  belongs_to :node
  belongs_to :group
end
