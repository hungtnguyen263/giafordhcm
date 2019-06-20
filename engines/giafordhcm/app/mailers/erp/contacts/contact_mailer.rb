module Erp::Contacts
  class ContactMailer < Erp::ApplicationMailer
    def sending_email_contact(msg)
      @message = msg
      
      #@todo static emails
      @recipients = ['Tường Nguyễn <npptuong@giadinhford.com.vn>'], 'Tường Nguyễn <tuong.npp@giafordhcm.com>']
      
      send_email(@recipients.join("; "), "#{@message.contact_phone} Thông báo tin nhắn trên hệ thống GiaFordHcm.com")
    end 
  end
end
