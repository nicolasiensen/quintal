require "rails_helper"

RSpec.feature "View the newest posts", type: :feature do
  scenario "when there is at least one post" do
    post = Post.make!

    visit root_path

    expect(page).to have_css(".Post h2", text: post.title)
    expect(page).to have_css(".Post time")
  end

  scenario "when there is more than one post" do
    post3 = Post.make! published_at: Time.now - 2.days
    post2 = Post.make! published_at: Time.now - 1.day
    post1 = Post.make! published_at: Time.now

    visit root_path

    expect(page.body.index(post1.title)).to be < page.body.index(post2.title)
    expect(page.body.index(post2.title)).to be < page.body.index(post3.title)
  end

  scenario "when there are more than 3 posts" do
    4.times { Post.make! }
    visit root_path
    expect(page).to have_css(".Post", count: 3)
  end
end
