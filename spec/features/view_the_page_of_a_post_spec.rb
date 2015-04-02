require "rails_helper"

RSpec.feature "View the page of a post", type: :feature do
  scenario "when it's a published post" do
    post = Post.make!

    visit post_path(post)

    expect(page).to have_css(".Post-title", text: post.title)
    expect(page).to have_css(".Post-info time", text: I18n.l(post.published_at, format: :short))
    expect(page).to have_css(".Post-info", text: post.category.name)
    expect(page).to have_css(".Post-body", text: post.body)
    post.tags.each do |tag|
      expect(page).to have_css(".Post-tag", text: tag.name)
    end
  end
end
