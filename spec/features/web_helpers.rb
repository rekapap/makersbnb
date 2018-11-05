def signup
  visit '/'
  fill_in('email', with: 'test@example.com')
  fill_in('first_name', with: 'John')
  fill_in('last_name', with: 'Doe')
  fill_in('password', with: 'password123')
  click_button('Sign up')
end
