class InquiryMailer < ActionMailer::Base
  default from: ENV['MY_MAIL_ADDRESS']   # 送信元アドレス
  default to: ENV['MY_MAIL_ADDRESS']      # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
end
