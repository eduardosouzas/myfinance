module ApplicationHelper
    def devise_sign_in?
        params[:controller] == 'users/sessions' ? '' : 'display:none;'
    end

    def devise_sign_up?
       params[:controller] == 'users/registrations' ? '' : 'display:none;'
    end

    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
    end
end
