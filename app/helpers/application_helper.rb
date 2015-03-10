module ApplicationHelper
  def category_link category
    content_tag(
      :a,
      category.name,
      href: category_posts_path(category.slug),
      class: [:item, category == @category ? "active" : nil]
    )
  end

  def categories
    @categories ||= Category.all
  end
end
