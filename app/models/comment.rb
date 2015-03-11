class Comment < ActiveRecord::Base
  belongs_to :user
  validates :post_id, :body, presence: true
end
