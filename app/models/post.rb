class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
  has_attached_file     :photo,
    :styles => {
      :thumb => "100x100#",
      :small => "300x300>" }
end
