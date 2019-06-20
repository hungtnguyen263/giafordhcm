class AddSubjectToErpContactsMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_contacts_messages, :subject, :string
  end
end
