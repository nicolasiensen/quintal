require "rails_helper"

RSpec.feature "View the newest posts", type: :feature do
  scenario "when there is at least one post" do
    post = Post.make!
    visit root_path

    expect(page).to have_css(".Post h2", text: post.title)
    expect(page).to have_css(".Post time")
  end

  scenario "when there are more than 10 posts" do
    11.times { Post.make! }

    visit root_path
    expect(page).to have_css(".Post", count: 10)
  end
end
