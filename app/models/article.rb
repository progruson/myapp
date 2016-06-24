class Article < ActiveRecord::Base
  belongs_to :categories
  belongs_to :comments

end
