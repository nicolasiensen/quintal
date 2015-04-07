class Post < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :comments
  validates :title, :category_id, :slug, presence: true
  validates :slug, uniqueness: true

  def to_param
    self.slug
  end
end
