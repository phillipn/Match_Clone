Fabricator(:profile) do
  religion { %w(Christianity Islam Judaism Buddhism Hinduism Atheistism Mormonism Other).sample }
  about_me { Faker::Lorem.paragraph }
  ideal_mate { Faker::Lorem.sentence }
  job { Faker::Lorem.sentence }
  hobbies { Faker::Lorem.sentence }
end