class UserMailer < ApplicationMailer

  default from: "mailboxforapplicationtest@gmail.com"

  def welcome_email(user)
    @user = user
    mail( :subject => 'Hello from Storyboards',
          :to      => @user.email )
  end

end
