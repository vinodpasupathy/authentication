class UserMailer < ApplicationMailer
 def user(user)
  #  @greeting = "params"
      #@greeting = "Hi"
    @user = user
  
    mail to: "your mail"  do |format|
#  format.html { render users: 'index.html.erb'}
  format.text {"User requested this domain  '#{@user}' localhost:3000/admins/sign_in"}
end
  end

end
