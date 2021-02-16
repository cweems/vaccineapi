class Instance < ApplicationRecord

    after_save :send_notification, if: Proc.new { saved_change_to_status?(from: nil, to: 'active') }

    def send_notification
        puts 'NEW PREPMOD INSTANCE DETECTED'
        puts self.state
        puts self.status
    end
end
