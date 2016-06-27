# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  title        :string
#  content      :text
#  category_id  :integer
#  source_link  :string
#  image_src    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  text_preview :text
#

class Article < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }

end
