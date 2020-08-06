FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.last_name}
    email                  {Faker::Internet.free_email}
    password =              Faker::Internet.password(min_length: 6)
    password               {password}
    password_confirmation  {password}
    family_name            {Gimei.last.kanji}
    first_name             {Gimei.first.kanji}
    family_name_kana       {Gimei.last.katakana}
    first_name_kana        {Gimei.first.katakana}
    birthday               {"2000/01/01"}
  end
end