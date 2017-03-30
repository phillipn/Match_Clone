Fabricator(:user) do
  first_name {Faker::Name.first_name}
  last_name {Faker::Name.last_name}
  password {'admin'}
  sex
  orientation
  email {Faker::Internet.email}
  user_info {[Fabricate()]}
  profile {[Fabricate()]}
  location {[Fabricate()]}
end

profile 
    t.integer  "user_id"
    t.text     "about_me"
    t.text     "ideal_mate"
    t.text     "job"
    t.text     "religion"
    t.text     "hobbies"
user_info
    t.integer  "user_id"
    t.string   "personality"
    t.integer  "max_age"
    t.integer  "min_age"
    t.string   "hair"
    t.string   "eye"
    t.string   "education"
    t.boolean  "kids"
    t.boolean  "date_kids"
    t.boolean  "want_kids"
    t.string   "politics"
    t.boolean  "date_politics"
    t.boolean  "smoke"
    t.boolean  "date_smoke"
    t.boolean  "tattoo"
    t.boolean  "date_tattoo"
    t.string   "religion"
    t.boolean  "date_religion"
    t.boolean  "pet"
    t.boolean  "date_pet"
    t.date     "birthday"
location
    t.integer  "user_id"
    t.float    "lng"
    t.float    "lat"
    t.string   "address"