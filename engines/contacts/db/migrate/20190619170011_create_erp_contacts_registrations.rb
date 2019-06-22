class CreateErpContactsRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_contacts_registrations do |t|
      t.references :contact, index: true, references: :erp_contacts_contacts
      t.string :payment_method
      t.references :product_category, index: true, references: :erp_products_categories

      t.timestamps
    end
  end
end
