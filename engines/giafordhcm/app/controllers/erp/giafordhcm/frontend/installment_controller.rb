module Erp
  module Giafordhcm
    module Frontend
      class InstallmentController < Erp::Frontend::FrontendController
        def index
          @article = Erp::Articles::Article.get_installment_articles.order('created_at desc').last
        end
      end
    end
  end
end