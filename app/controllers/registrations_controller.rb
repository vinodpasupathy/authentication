class RegistrationsController < Devise::RegistrationsController
  
  def new
    super                  #inheriting the class from Device controller
  end

  def create
    super    
      @domain_name=Mail::Address.new(user_params["email"]).domain     #get the domain name from the email entered
      @check_domain_status=Domain.where(:d_name=>@domain_name).pluck(:role)[0]        #checks domains avilability in the Approved/Unapproved List
      @user = User.new(user_params)   #gets user details from the form
        case @check_domain_status
          when 1             #this is for approved domains
            @user.save       #Save the user data
          when 0             #For unapproved domains
            UserMailer.user(@domain_name).deliver	   #mail sent to the admin
            flash[:notice] = "Your request was sent to the Admin. Please try again after some time."
        else                 #Not in the Approved/Unapproved List
            flash[:notice] = "oops! Your domain was not accepted"
        end
  end

  def update
    super
  end
private
def user_params
 params.require(:user).permit!
end

end 
