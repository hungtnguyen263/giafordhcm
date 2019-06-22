module Erp::Contacts
  class ContactMailer < Erp::ApplicationMailer
    # Tin nhắn contact us
    def sending_email_contact(msg)
      @message = msg
      
      #@todo static emails
      @recipients = ['Tường Nguyễn <npptuong@giadinhford.com.vn>']
      
      send_email(@recipients.join("; "), "#{@message.contact_phone} Thông báo tin nhắn trên hệ thống GiaFordHcm.com")
    end
    
    # Đăng ký báo giá
    def sending_email_contact_register(register)
      @register = register
      
      #@todo static emails
      @recipients = ['Tường Nguyễn <npptuong@giadinhford.com.vn>']
      
      send_email(@recipients.join("; "), "#{@register.contact_phone} Thông báo yêu cầu báo giá/lái thử trên hệ thống GiaFordHcm.com")
    end 
  end
end
