module Erp
  module Giafordhcm
    module Frontend
      class HomeController < Erp::Frontend::FrontendController
        def index
          @sliders = Erp::Banners::Banner.get_home_sliders.order('erp_banners_banners.custom_order asc')
          @newest_blogs = Erp::Articles::Article.newest_articles(10)
        end
      end
    end
  end
end