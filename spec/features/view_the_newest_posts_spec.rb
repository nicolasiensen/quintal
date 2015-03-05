require "rails_helper"

RSpec.feature "View the newest posts", type: :feature do
  scenario "when there is at least one post" do
    post = Post.make!
    visit root_path

    expect(page).to have_css("article header", text: post.title)
  end
end
