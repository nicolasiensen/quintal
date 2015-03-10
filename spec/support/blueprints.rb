require 'machinist/active_record'

Post.blueprint do
  title { "My post #{sn}" }
  published_at { Time.now }
  category_id { Category.make!.id }
end

Category.blueprint do
  name { "Category #{sn}" }
  slug { "category-#{sn}" }
end
