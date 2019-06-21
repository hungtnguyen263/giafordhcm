module Erp::Contacts
  class ContactMailer < Erp::ApplicationMailer
    def sending_email_contact(msg)
      @message = msg
      
      #@todo static emails
      @recipients = ['Tường Nguyễn <npptuong@giadinhford.com.vn>', 'Tường Nguyễn <tuong.npp@giafordhcm.com>']
      
      send_email(@recipients.join("; "), "#{@message.contact_phone} Thông báo tin nhắn trên hệ thống GiaFordHcm.com")
    end
    
    def sending_email_registration_quote(@registration_quote)
      @registration_quote = registration_quote
      
      #@todo static emails
      @recipients = ['Tường Nguyễn <npptuong@giadinhford.com.vn>', 'Tường Nguyễn <tuong.npp@giafordhcm.com>']
      
      send_email(@recipients.join("; "), "#{@registration_quote.contact_phone} Thông báo yêu cầu báo giá/lái thử trên hệ thống GiaFordHcm.com")
    end 
  end
end
