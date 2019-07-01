Erp::Giafordhcm::Engine.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "frontend/home#index"
    
    get "gioi-thieu.html" => "frontend/about_us#index", as: :about_us
    get "lien-he.html" => "frontend/contact_us#index", as: :contact_us
    post "lien-he.html" => "frontend/contact_us#index"
    get "dang-ky.html" => "frontend/contact_us#registration_form", as: :registration_form
    #post "dang-ky.html" => "frontend/contact_us#registration_form"
    post "gui-yeu-cau.html" => "frontend/contact_us#registration", as: :contact_register
    
    get "tra-gop.html" => "frontend/installment#index", as: :installment
    get "bang-gia.html" => "frontend/price#list", as: :price_list
    get "san-pham.html" => "frontend/product#list", as: :all_product
    get "san-pham/:title-sp-:product_id.html" => "frontend/product#detail", as: :product_detail
    get ":title-dx-:menu_id.html" => "frontend/product#category", as: :product_listing
    
    get ":title-dsbv-:category_id.html" => "frontend/blog#index", as: :blog
    get "bai-viet/:title-bl-:blog_id.html" => "frontend/blog#detail", as: :blog_detail
    get ":title-cus-:article_id.html" => "frontend/blog#custom_single_post", as: :custom_single_post
  end
end