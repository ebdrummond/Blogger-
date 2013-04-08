class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list, :image
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }


 
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def to_s
    name
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by_name(name)}
    self.tags = new_or_found_tags
  end


end