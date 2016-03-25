# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  from       :string
#

class Note < ActiveRecord::Base
  before_save do 
    if self.new_record?
      mail = Mail.new
      mail.from "TheBackpackerRetreat <thebackpackerretreat@gmail.com>"
      mail.to "TheBackpackerRetreat <thebackpackerretreat@gmail.com>"
      mail.reply_to "#{self.from} <#{self.email}>"
      mail.subject "Note from #{self.from}"
      mail.text_part = Mail::Part.new
      mail.text_part.content_type 'text/plain; charset=UTF-8'
      mail.text_part.body self.content
      mail.delivery_method :smtp, \
        address: "smtp.gmail.com",
        port: 587,
        user_name: 'thebackpackerretreat@gmail.com',
        password: 'uVy9xDMgv36r',
        authentication: :plain,
        enable_starttls_auto: true
      begin
        mail.deliver!
      rescue Exception => e
        throw e
      end
    end
  end
end
