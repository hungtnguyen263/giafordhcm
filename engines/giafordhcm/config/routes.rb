Erp::Giafordhcm::Engine.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "frontend/home#index"
    
    get "gioi-thieu.html" => "frontend/about_us#index", as: :about_us
    
    get "san-pham.html" => "frontend/product#list", as: :all_product
    get ":title(-:menu_id).html" => "frontend/product#category", as: :product_listing
    get "san-pham/:title-(:product_id).html" => "frontend/product#detail", as: :product_detail
  end
end