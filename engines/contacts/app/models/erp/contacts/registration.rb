module Erp::Contacts
  class Registration < ApplicationRecord
    belongs_to :contact, class_name: "Erp::Contacts::Contact"
    belongs_to :product_category, class_name: "Erp::Products::Category", foreign_key: :product_category_id
    validates :payment_method, presence: true
    
    # class const
    METHOD_FULLY_PAID = 'fully_paid'
    METHOD_INSTALMENTS = 'instalments'
    
    # Filters
    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []
      
      #filters
      if params["filters"].present?
        params["filters"].each do |ft|
          or_conds = []
          ft[1].each do |cond|
            or_conds << "#{cond[1]["name"]} = '#{cond[1]["value"]}'"
          end
          and_conds << '('+or_conds.join(' OR ')+')' if !or_conds.empty?
        end
      end
      
      #keywords
      if params["keywords"].present?
        params["keywords"].each do |kw|
          or_conds = []
          kw[1].each do |cond|
            or_conds << "LOWER(#{cond[1]["name"]}) LIKE '%#{cond[1]["value"].downcase.strip}%'"
          end
          and_conds << '('+or_conds.join(' OR ')+')'
        end
      end
      
      # join with users table for search creator
      query = query.joins(:contact)
      
      # add conditions to query
      query = query.where(and_conds.join(' AND ')) if !and_conds.empty?
      
      return query
    end
    
    def self.search(params)
      query = self.all
      query = self.filter(query, params)
      
      # order
      if params[:sort_by].present?
        order = params[:sort_by]
        order += " #{params[:sort_direction]}" if params[:sort_direction].present?
        
        query = query.order(order)
      end
      
      return query
    end
    
    def contact_name
      contact.present? ? contact.name : ''
    end
    
    def contact_email
      contact.present? ? contact.email : ''
    end
    
    def contact_phone
      contact.present? ? contact.phone : ''
    end
    
    def contact_state_name
      contact.present? ? contact.state_name : ''
    end
    
    def product_category_name
      product_category.present? ? product_category.name : ''
    end
  end
end
