class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in user
            #flash[:success] = "Welcome to the Sample App!"
            redirect_to user
        else
            flash.now[:error] = 'Invalid email/password combination'
            render 'new'
        end
    end

    def destroy
        sign_out
        flash[:notice] = "See you next time!"
        redirect_to root_url
    end
end