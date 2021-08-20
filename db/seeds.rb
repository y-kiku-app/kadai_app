AdminUser.find_or_create_by(id: 1) do |admin|
    admin.email = "example@example.com"
    admin.password = "example"
   end
