module ApplicationHelper
  def category_link category
    content_tag(
      :a,
      href: category_posts_path(category.slug),
      class: [:item, category == @category ? "active" : nil]
    ) do
      content_tag(:i, "", class: [:fa, category_icon(category.name)]) + " " + category.name
    end
  end

  def category_icon category_name
    return "fa-eye" if category_name == "Beleza"
    return "fa-camera-retro" if category_name == "Lifestyle"
    return "fa-paint-brush" if category_name == "Decor"
    return "fa-cutlery" if category_name == "Gastronomia"
  end

  def categories
    @categories ||= Category.all
  end
end
