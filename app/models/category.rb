class Category < ActiveRecord::Base
  validates :name, :slug, presence: true
  validates :slug, uniqueness: true

  def to_param
    self.slug
  end
end
