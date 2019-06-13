module Erp
  module Giafordhcm
    module Frontend
      class ContactUsController < Erp::Frontend::FrontendController
        def index
        end
        def registration_form
          render layout: nil
        end
      end
    end
  end
end