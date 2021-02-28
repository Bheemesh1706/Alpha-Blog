class PagesController < ApplicationController

    def main
        redirect_to articles_path if logged_in?
    end

    def about
    end

    def bot
    end
end
