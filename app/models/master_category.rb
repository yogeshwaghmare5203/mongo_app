class MasterCategory
  include Mongoid::Document
  include Mongoid::Paperclip


  has_mongoid_attached_file :category_image

  field :category_name, :type => String
  field :category_image, :type => String
  field :entity_name_obligatory, :type => Boolean
  field :is_active, :type => Boolean
  field :created_time, :type =>  Time
  field :modified_time, :type => Time
end
