class WelcomeController < ApplicationController
    def index
        @sources = Instance.where(status: 'active')
    end
end
