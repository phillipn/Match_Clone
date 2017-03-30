Fabricator(:user_info) do
  personality { %w(ESTJ ISTJ INTJ ISTP ESTP ENTJ INTP ENFJ INFJ ISFJ ISFP ENTP ESFJ ESFP ENFP INFP).sample }
  max_age { Faker::Number.between(18, 30) }
  min_age { Faker::Number.between(30, 110)}
  hair { %w(Blonde Brunette Grey Red Other).sample }
  eye { %w(Other Hazel Brown Green Gray Blue).sample }
  education { %w(Doctorate Masters\ Degree Undergraduate\ Degree High\ School).sample }
  kids { Faker::Boolean.boolean }
  date_kids { Faker::Boolean.boolean }
  want_kids { Faker::Boolean.boolean }
  politics { %w(Moderate Conservative Liberal).sample }
  date_politics { Faker::Boolean.boolean }
  smoke { Faker::Boolean.boolean }
  date_smoke { Faker::Boolean.boolean }
  tattoo { Faker::Boolean.boolean }
  date_tattoo { Faker::Boolean.boolean }
  religion { %w(Christianity Islam Judaism Buddhism Hinduism Atheistism Mormonism Other).sample }
  date_religion { Faker::Boolean.boolean }
  pet { Faker::Boolean.boolean }
  date_pet { Faker::Boolean.boolean }
  birthday { Faker::Date.birthday(18, 110) }
end