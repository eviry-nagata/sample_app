class ApplicationMailer < ActionMailer::Base
  # from@example.comから送信
  default from: "noreply@example.com"
  layout 'mailer'
end
