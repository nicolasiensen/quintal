require "rails_helper"

RSpec.feature "View the page of a post", type: :feature do
  scenario "when it's a published post" do
    post = Post.make!

    visit post_path(post)

    expect(page).to have_css("header h2", text: post.title)
    expect(page).to have_css("header time", text: I18n.l(post.published_at, format: :short))
    expect(page).to have_css("header .Category", text: post.category.name)
    expect(page).to have_css("article", text: post.body)
    post.tags.each do |tag|
      expect(page).to have_css("footer", text: tag.name)
    end
  end
end
