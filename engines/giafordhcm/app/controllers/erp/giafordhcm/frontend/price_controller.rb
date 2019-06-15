module Erp
  module Giafordhcm
    module Frontend
      class PriceController < Erp::Frontend::FrontendController        
        def list
          @menus = Erp::Menus::Menu.get_active.where.not(parent_id: nil)
        end
      end
    end
  end
end