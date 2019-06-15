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
          @product = Erp::Products::Product.find(params[:product_id])
          @menu = params[:menu_id].present? ? Erp::Menus::Menu.find(params[:menu_id]) : @product.find_menu
          
          @meta_keywords = @product.meta_keywords
          @meta_description = @product.meta_description
          
          if @menu.present?
            if !@product.meta_keywords.present?
              @meta_keywords = @menu.meta_keywords
            end
            
            if !@product.meta_description.present?
              @meta_description = @menu.meta_description
            end
          end
        end
      end
    end
  end
end