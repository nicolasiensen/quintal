require "rails_helper"

RSpec.feature "View posts by category", type: :feature do
  let(:category) { Category.make! }

  scenario "when there is a post that belongs to the category" do
    post = Post.make! category_id: category.id
    visit category_posts_path(category)
    expect(page).to have_css(".Post h2", text: post.title)
  end

  scenario "when there is a post that doesn't belongs to the category" do
    post = Post.make!
    visit category_posts_path(category)
    expect(page).to_not have_css(".Post h2", text: post.title)
  end
end
