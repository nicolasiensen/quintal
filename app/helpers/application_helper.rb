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

  def meta_tags_for_post post
    {
      title: post.title,
      decription: post.description,
      og: {
        title: post.title,
        url: request.url,
        image: post.image_url,
        description: post.description,
        type: "article"
      }
    }
  end

  def meta_tags_for_category category
    {
      title: category.name,
      decription: "Tudo sobre #{category.name}",
      og: {
        title: category.name,
        url: request.url,
        image: image_url("fe.jpg"),
        description: "Tudo sobre #{category.name}",
        type: "website"
      }
    }
  end

  def default_meta_tags
    {
      site: t("meta.title"),
      description: t("meta.description"),
      keywords: ["gastronomia", "decoração", "beleza", "estilo de vida", "viagem"],
      og: {
        title: t("meta.title"),
        url: request.url,
        image: image_url("fe.jpg"),
        description: t("meta.description"),
        type: "website"
      }
    }
  end
end
