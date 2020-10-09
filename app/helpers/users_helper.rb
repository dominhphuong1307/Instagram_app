module UsersHelper
    
    def check_filed?
        !current_user.username.nil?
    end
end
