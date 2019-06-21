class AddSpecificationsToErpProductsProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_products_products, :body, :string
    add_column :erp_products_products, :engine_type, :string
    add_column :erp_products_products, :transmission, :string
    add_column :erp_products_products, :max_power, :string
    add_column :erp_products_products, :max_torque, :string
    add_column :erp_products_products, :length_width_height, :string
  end
end
