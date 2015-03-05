require 'machinist/active_record'

Post.blueprint do
  title { "My post" }
end
