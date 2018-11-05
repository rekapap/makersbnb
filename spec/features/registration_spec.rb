feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('email', with: 'test@example.com')
    fill_in('first_name', with: 'John')
    fill_in('last_name', with: 'Doe')
    fill_in('password', with: 'password123')
    click_button('Sign up')
    expect(page).to have_content 'Book a space'
  end
end
