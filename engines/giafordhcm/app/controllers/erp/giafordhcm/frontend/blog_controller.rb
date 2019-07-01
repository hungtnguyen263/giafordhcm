module Erp
  module Giafordhcm
    module Frontend
      class BlogController < Erp::Frontend::FrontendController
        def index
          @category = Erp::Articles::Category.find(params[:category_id])
          @blogs = Erp::Articles::Article.get_all_blogs(params).paginate(:page => params[:page], :per_page => 6)
        end
        
        def detail
          @blog = Erp::Articles::Article.find(params[:blog_id])
          @categories = Erp::Articles::Category.get_categories_by_alias_blog
          @newest_articles = Erp::Articles::Article.newest_articles(6)
            .where.not(id: @blog.id)
          @meta_keywords = @blog.meta_keywords
          @meta_description = @blog.meta_description
        end
        
        def custom_single_post
          @article = Erp::Articles::Article.find(params[:article_id])
          @meta_keywords = @article.meta_keywords
          @meta_description = @article.meta_description
        end
      end
    end
  end
end