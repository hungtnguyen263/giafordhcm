module Erp
  module Giafordhcm
    module ApplicationHelper
      # page title helper
      def title(page_title)
        content_for :title, page_title.to_s
      end
      
      # menu link helper
      def menu_link(menu)
        erp_giafordhcm.product_listing_path(title: url_friendly(menu.name), menu_id: menu.id)
      end
      
      # product link helper
      def product_link(product)
        erp_giafordhcm.product_detail_path(product_id: product.id, title: url_friendly(product.name))
      end
      
      # blogs helper
      def blogs_link(category)
        erp_giafordhcm.blog_path(category_id: category.id, title: url_friendly(category.name))
      end
      
      # blog link
      def blog_link(blog)
        erp_giafordhcm.blog_detail_path(title: url_friendly(blog.name), blog_id: blog.id)
      end
      
      # custom blog link / bai viet lai thu/mua xe cu gia cao
      def single_post_link(article)
        erp_giafordhcm.custom_single_post_path(title: url_friendly(article.name), article_id: article.id)
      end
      
      # product image
      def product_image(images, ordinal, thumb)
        if images.present?
          images.count < 2 ? images.first.image_url.send(thumb).url : images.send(ordinal).image_url.send(thumb).url
        else
          url_for('/frontend/images/no-image.png')
        end
      end
      
      # article image
      def article_image(thumb, size)
        if size == 'large'
          thumb.present? ? thumb : url_for('/frontend/images/blog/848_309.png')
        elsif size == 'medium'
          thumb.present? ? thumb : url_for('/frontend/images/blog/270_175.png')
        elsif size == 'small'
          thumb.present? ? thumb : url_for('/frontend/images/blog/75_75.png')
        end
      end
      
      # display full address
      def full_address(contact)
        str = []
        str << contact.address if contact.address.present?
        str << contact.district_name if contact.district_name.present?
        str << contact.state_name if contact.state_name.present?
        str.join(", ")
      end
    end
  end
end
