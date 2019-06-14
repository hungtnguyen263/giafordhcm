module Erp
  module Giafordhcm
    module Frontend
      class ProductController < Erp::Frontend::FrontendController
        def list
          @menus = Erp::Menus::Menu.get_active.where.not(parent_id: nil)
        end
        
        def category
          @menu = Erp::Menus::Menu.find(params[:menu_id])
          @products = @menu.get_products_for_categories(params).paginate(:page => params[:page], :per_page => @menu.number_per_page)
          @meta_keywords = @menu.meta_keywords
          @meta_description = @menu.meta_description
        end
        
        def detail
        end
      end
    end
  end
end