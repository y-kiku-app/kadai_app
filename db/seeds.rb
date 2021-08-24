AdminUser.find_or_create_by(id: 1) do |admin|
  admin.email = "example@example.com"
  admin.password = "abc12345"
end

50.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    password: "abc12345"
  )
end
