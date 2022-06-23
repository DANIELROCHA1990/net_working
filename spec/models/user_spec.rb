require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user is valid' do
    user = User.new(
      name: 'user1',
      phone: '99999 9999',
      email: 'user@user.com',
      password: 'user123',
      avatar: fixture_file_upload(Rails.root.join('spec', 'support', 'test-avatar.png'), 'image/png')
    )

    expect(user.email).to eql('user@user.com')
    expect(user).to be_valid
  end

  it 'user is not valid' do
    user = User.new(
      name: nil,
      phone: nil,
      email: 'user@user.com',
      password: nil,
      avatar: nil
    )

    expect(user).to_not be_valid
  end
end
