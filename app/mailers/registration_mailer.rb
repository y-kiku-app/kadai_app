class RegistrationMailer < ApplicationMailer

  def welcome(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'ようこそ')
  end
end
