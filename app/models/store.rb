class Store
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  validates :name, :presence => true

  embeds_many :tags, cascade_callbacks: true
  validate :tags_can_not_have_duplicateed_tags

  embeds_many :comments, cascade_callbacks: true
  
  accepts_nested_attributes_for :tags, 
                                :reject_if=> proc{|tag| tag[:name].blank? }
  accepts_nested_attributes_for :comments, 
                                :reject_if=> proc{|comment| comment[:comment].blank? }

  def tags_can_not_have_duplicateed_tags
    if tags.group_by{|tag| tag.name}.values.find{|e| e.count > 1}
      errors.add(:base, :tags_can_not_have_duplicateed_tags)
    end
  end

end
