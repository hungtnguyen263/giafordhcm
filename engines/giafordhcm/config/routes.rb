Erp::Giafordhcm::Engine.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "frontend/home#index"
    
    get "gioi-thieu.html" => "frontend/about_us#index", as: :about_us
    get "lien-he.html" => "frontend/contact_us#index", as: :contact_us
    get "dang-ky.html" => "frontend/contact_us#registration_form", as: :registration_form
    
    get "bang-gia.html" => "frontend/product#price_list", as: :price_list
    get "san-pham.html" => "frontend/product#list", as: :all_product
    get "san-pham/:title-sp-:product_id.html" => "frontend/product#detail", as: :product_detail
    get ":title-dx-:menu_id.html" => "frontend/product#category", as: :product_listing
  end
end