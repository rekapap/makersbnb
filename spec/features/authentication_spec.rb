feature 'authentication' do
  scenario 'a user can sign in' do
    User.create_account(email: 'test@example.com', first_name: "John" , last_name: "Doe", password: 'password123' )

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Book a space'
  end
end
