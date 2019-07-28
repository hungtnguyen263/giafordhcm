class AddVideoLinkToErpBannersBanners < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_banners_banners, :video_link, :string
  end
end
