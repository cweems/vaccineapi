class WelcomeController < ApplicationController
    def index
        @sources = Instance.where(status: 'active')
        @clinic_count = Clinic.count
    end
end
