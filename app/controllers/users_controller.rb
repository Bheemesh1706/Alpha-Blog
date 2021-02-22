class UsersController < ApplicationController

    def new 
        @user=User.new
    end

    def create
        @user = User.new(user_params)
          if @user.save
            flash[:notice]="Wlecome #{@user.username} Sucessfully Signup"
            redirect_to article_path
          else
            render 'new'
          end
    end

    private

    #def set_article
       # @article =Article.find(params[:id])
    #end
    
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end

end