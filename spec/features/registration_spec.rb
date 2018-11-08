feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('email', with: 'test@example.com')
    fill_in('first_name', with: 'John')
    fill_in('last_name', with: 'Doe')
    fill_in('password', with: 'password123')
    click_button('Sign up')
    expect(page).to have_content 'Spaces'
  end

  scenario 'a user cannot sign up with the same email' do
    User.create_account(email: 'test@example.com', first_name: 'John',
                        last_name: "Doe", password: 'password123')
    visit '/'
    fill_in('email', with: 'test@example.com')
    fill_in('first_name', with: 'Jane')
    fill_in('last_name', with: 'Smith')
    fill_in('password', with: 'password567')
    click_button('Sign up')

    expect(page).to have_content 'Email already exsists!'
  end

end
