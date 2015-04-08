# It's required by the description method
include ActionView::Helpers::TextHelper
include ActionView::Helpers::SanitizeHelper

class Post < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :comments
  validates :title, :category_id, :slug, presence: true
  validates :slug, uniqueness: true

  def to_param
    self.slug
  end

  def image_url
    if match = self.body.match(/\<img.+src\=\"(\S+)\"/)
      match[1]
    end
  end

  def description
    truncate(strip_tags(self.body), length: 200)
  end
end
