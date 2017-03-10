puts '建立預設使用者。' if User.first_or_create!([
  {
    name: 'Admin',
    email: 'admin@gmail.com',
    password: '12345678',
    password_confirmation: '12345678',
    is_admin: true
  }
])
