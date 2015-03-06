class Category < ActiveRecord::Base
  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
end
