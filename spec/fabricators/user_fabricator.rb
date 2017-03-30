Fabricator(:user) do
  first_name {Faker::Name.first_name}
  last_name {Faker::Name.last_name}
  password {'admin'}
  sex {Faker::Demographic.sex}
  orientation { %w(Straight Bi-Sexual Gay).sample }
  email {Faker::Internet.unique.email}
  picture { Faker::LoremPixel.image }
  user_info 
  profile 
end