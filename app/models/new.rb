class New < ActiveRecord::Base
  belongs_to :category
  belongs_to :comment

end
