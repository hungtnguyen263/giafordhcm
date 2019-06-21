class AddIsMainToErpContactsContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_contacts_contacts, :is_main, :boolean, default: false
  end
end
