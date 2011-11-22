class Post < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :content

  def author
    User.find_by_id(author_id)
  end

end
