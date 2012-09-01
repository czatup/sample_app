class UsersController < ApplicationController

    before_filter :signed_in_user,  only: [:index, :edit, :update]
    before_filter :correct_user,    only: [:edit, :update]
    before_filter :admin_user,      only: :destroy
    before_filter :user_boundaries, only: [:create, :new]

    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            sign_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
        #@user = User.find(params[:id]) before_filter :correct_user already has checked it
    end

    def update
        #@user = User.find(params[:id]) before_filter :correct_user already has checked it
        if @user.update_attributes(params[:user])
            flash[:success] = "Profile updated"
            sign_in @user
            redirect_to @user
        else
            render 'edit'
        end
    end

    def index
        @users = User.paginate(page: params[:page])
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User destroyed"
        redirect_to users_url
    end


    private

        def correct_user
            @user = User.find(params[:id])
            unless current_user?(@user)
                flash[:notice] = "You cannot perform that action."
                redirect_to(root_url)
            end
        end

        def admin_user
            redirect_to(root_url) unless current_user.admin?
        end

        def user_boundaries
            #flash[:notice] = "You are already signed in."
            redirect_to(root_url) unless !signed_in?
        end
end