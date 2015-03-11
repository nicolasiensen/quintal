require 'machinist/active_record'

Post.blueprint do
  title { "My post #{sn}" }
  published_at { Time.now }
  category_id { Category.make!.id }
  body { "My post body #{sn}" }
  tags(3)
  slug { "my-post-#{sn}" }
end

Category.blueprint do
  name { "Category #{sn}" }
  slug { "category-#{sn}" }
end

Tag.blueprint do
  name { "Tag #{sn}" }
end

Comment.blueprint do
  body { "My comment #{sn}" }
  user_id { User.make!.id }
end

User.blueprint do
  name { "User #{sn}" }
end
