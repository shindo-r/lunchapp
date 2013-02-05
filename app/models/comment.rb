class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment, :type => String
  validates :comment, :presence => true
  
  embedded_in :store

end
