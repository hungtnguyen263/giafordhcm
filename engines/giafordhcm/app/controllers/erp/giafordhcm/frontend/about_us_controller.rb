module Erp
  module Giafordhcm
    module Frontend
      class AboutUsController < Erp::Frontend::FrontendController
        def index
          @web_info = Erp::Contacts::Contact.get_main_contact
        end
      end
    end
  end
end