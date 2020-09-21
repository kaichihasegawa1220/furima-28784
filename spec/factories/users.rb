FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname { Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'1p' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {gimei.first.kanji}
    last_name {gimei.last.kanji}
    first_name_kana {gimei.first.katakana}
    last_name_kana {gimei.last.katakana}
    birth_day {Faker::Date.birthday}
  end
end
