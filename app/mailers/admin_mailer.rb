class AdminMailer < ApplicationMailer
 def admin(domain)
  #  @greeting = "params"
      #@greeting = "Hi"
    @domain = domain

    mail to: "your mail"  do |format|
#  format.html { render users: 'index.html.erb'}
  format.text {"User requested this domain  '#{@domain}' localhost:3000/admins/sign_in"}
end
  end
end
