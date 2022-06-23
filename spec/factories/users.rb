FactoryBot.define do
  factory :user do
    name { 'Daniel' }
    phone { '32845680' }
    email { 'teste@teste.com' }
    password { 'daniell123' }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test-avatar.png'), 'image/png') }
  end
end
