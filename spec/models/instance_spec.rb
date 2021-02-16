require 'rails_helper'

RSpec.describe Instance, type: :model do
  subject = Instance.new(state: 'whocares', url: 'does not matter', status: nil)

  it "does not call send notification on initial save" do
    expect(subject).to_not receive(:send_notification)
    subject.save!
  end

  it "calls send notification function when instance active changes from null to true" do
    expect(subject).to receive(:send_notification)
    subject.update!(status: 'active')
  end
end
