class SessionsController < ApplicationController
    layout 'ready', except: [:destroy]
    def new
    end
    def create
        flash[:success]= []
        flash[:alert] = []
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            flash[:success] << "Click on the Home Icon, then Click on Question Mark Icon, to find Help."
            log_in(user)
            redirect_to dashboard_index_path
        else
            flash.now[:alert] << "Invalid email or password" 
            render 'new'
        end
    end
    def destroy
        log_out
        redirect_to root_url
    end
end