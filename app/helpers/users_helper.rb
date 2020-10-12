module UsersHelper
    
    def check_field?
        !current_user.username.nil?
    end
end
