class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  validates :name, :presence => true

  embedded_in :store

end
