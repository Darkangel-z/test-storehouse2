FactoryGirl.define do
  factory :product do
    # image { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png') }
    image Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/img1.jpg", "image/jpg")
    sequence(:name) { |n| "product #{n}" }

  end
end
