module Erp
  module Giafordhcm
    module ApplicationHelper
      # page title helper
      def title(page_title)
        content_for :title, page_title.to_s
      end
      
      # menu link helper
      def menu_link(menu)
        erp_giafordhcm.product_listing_path(menu_id: menu.id, title: url_friendly(menu.name))
      end
      
      # product link helper
      def product_link(product)
        erp_giafordhcm.product_detail_path(product_id: product.id, title: url_friendly(product.name))
      end
    end
  end
end
