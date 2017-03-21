class Users::SessionsController < Devise::SessionsController

    def new
        super do |resource|
            resource.build_profile_user
        end

    end

    protected

    def after_sign_in_path_for(resource)
        home_index_path
    end

end
