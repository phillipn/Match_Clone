Fabricator(:location) do
  lng  { Faker::Address.longitude }
  lat { Faker::Address.latitude }
  address { }
end