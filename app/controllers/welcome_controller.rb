class WelcomeController < ApplicationController
    def index
        redirect_to user_path(current_user.id);
    end
    
    def about
    end
end
