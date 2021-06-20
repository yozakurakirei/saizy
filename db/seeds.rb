# adminユーザー
User.create!(name:  "admin",
  email: "admin@example.com",
  password:              "password",
  password_confirmation: "password",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

# # testユーザー
User.create!(name:  "test",
  email: "test@example.com",
  password:              "password",
  password_confirmation: "password",
  admin: false,
  activated: true,
  activated_at: Time.zone.now)

# タグ
Tag.create([
  { name: "洋菓子" },
  { name: "和菓子" },
  { name: "お弁当・惣菜" },
  { name: "グローサリー" },
  { name: "パン" },
  { name: "飲料" },
  { name: "お酒" },
  { name: "その他" }
])

# # 追加のユーザーをまとめて生成する
55.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(word_count: 5)
#   title = Faker::Lorem.sentence(word_count: 5)
#   users.each { |user| user.microposts.create!( content: content, title: title ) }
# end