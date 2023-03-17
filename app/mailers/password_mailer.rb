class PasswordMailer < ApplicationMailer
  def reset
    @greetings = 'Hi'
    params[:user]

    mail to: params[:user].email
  end
end
