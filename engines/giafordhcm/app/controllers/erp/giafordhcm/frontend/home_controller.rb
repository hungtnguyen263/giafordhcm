module Erp
  module Giafordhcm
    module Frontend
      class HomeController < Erp::Frontend::FrontendController
        def index
          @web_info = Erp::Contacts::Contact.get_main_contact
          
          @sliders = Erp::Banners::Banner.get_home_sliders.order('erp_banners_banners.custom_order asc')
          @newest_blogs = Erp::Articles::Article.newest_articles(10)
          @photos = Erp::Banners::Banner.get_souvenir_banners.order('erp_banners_banners.custom_order asc')
        end
      end
    end
  end
end