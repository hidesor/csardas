puts '建立預設使用者。' if User.first_or_create!([
  {
    name: '系統管理員',
    phone: '0921876501',
    email: 'admin@adata.com',
    password: '12345678',
    password_confirmation: '12345678',
    role: 'admin',
    is_active: true
  },
  {
    name: '安心服務處管理員',
    phone: '0921876501',
    email: 'manager@adata.com',
    password: '12345678',
    password_confirmation: '12345678',
    role: 'manager',
    is_active: true
  },
  {
    name: '消費者',
    phone: '0921876703',
    email: 'customer@adata.com',
    password: '12345678',
    password_confirmation: '12345678',
    role: 'customer',
    is_active: true
  }
])
