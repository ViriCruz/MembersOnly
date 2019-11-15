class StaticPagesController < ApplicationController    
    def home        
        redirect_to user_url(current_user) if signed_in?
    end
end
