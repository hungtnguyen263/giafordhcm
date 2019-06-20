module Erp
  module Giafordhcm
    module Frontend
      class ContactUsController < Erp::Frontend::FrontendController
        def index
          #@company_info = Erp::Contacts::Contact.get_main_contact
          
          if params[:contact].present?
            @contact = Erp::Contacts::Contact.new(contact_params)
            if @contact.save and params[:message].present?
              @message = Erp::Contacts::Message.new(message_params)
              @message.contact_id = @contact.id
              # @todo get email receive contact
              #@msg.to_contact_id = Erp::Contacts::Contact.first.id
              if @message.save
                #Erp::Contacts::ContactMailer.sending_email_contact(@msg).deliver_now
                  render :json => {status: 'success', notice: 'Tin nhắn đã được gửi thành công. Chúng tôi sẽ sớm liên hệ lại với Quý vị.'}
              end
            else
              
              render :json => {status: 'error', notice: 'Không thể gửi đi! Vui lòng cung cấp đầy đủ thông tin và thử lại.'}
            end
          end
        end
        
        def registration_form
          render layout: nil
        end
        
        private
          def contact_params
            params.fetch(:contact, {}).permit(:name, :email, :phone, :state_id)
          end
          
          def message_params
            params.fetch(:message, {}).permit(:subject, :message)
          end
      end
    end
  end
end