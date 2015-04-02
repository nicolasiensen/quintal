require "rails_helper"

RSpec.feature "View the comments of a post", type: :feature do
  scenario "when there is no comment" do
    post = Post.make!
    visit post_path(post)
    expect(page).to have_css(".CommentList-empty")
  end

  scenario "when there is at least one comment" do
    post = Post.make!
    comment = Comment.make! post_id: post.id

    visit post_path(post)

    expect(page).to_not have_css(".CommentList-empty")
    expect(page).to have_css(".Comment", text: comment.body)
    expect(page).to have_css(".Comment-user", text: comment.user.name)
    expect(page).to have_css(".Comment-createdAt", text: I18n.l(comment.created_at, format: :short))
  end

  scenario "when there is more than one comment" do
    post = Post.make!
    comment3 = Comment.make! post_id: post.id, created_at: Time.now - 2.days
    comment2 = Comment.make! post_id: post.id, created_at: Time.now - 1.day
    comment1 = Comment.make! post_id: post.id, created_at: Time.now

    visit post_path(post)

    expect(page.body.index(comment1.body)).to be < page.body.index(comment2.body)
    expect(page.body.index(comment2.body)).to be < page.body.index(comment3.body)
  end
end
