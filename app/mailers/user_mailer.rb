class UserMailer < ApplicationMailer
 def user(user)
  #  @greeting = "params"
      #@greeting = "Hi"
    @user = user
  
    mail to: "whiteplaast@gmail.com"  do |format|
#  format.html { render users: 'index.html.erb'}
  format.text {"User requested this domain  '#{@user}' 192.168.1.59:3000/admins/sign_in"}
end
  end

end
