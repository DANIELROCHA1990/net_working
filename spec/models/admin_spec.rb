require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'admin is valid' do
    admin = Admin.new(email: 'admin@admin.com', password: 'admin123')

    expect(admin.email).to eql('admin@admin.com')
    expect(admin).to be_valid
  end

  it 'admin is not valid' do
    admin = Admin.new(email: 'admin@admin.com')

    expect(admin).to_not be_valid
  end
end
