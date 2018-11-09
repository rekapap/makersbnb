feature 'chatbox' do
  scenario 'landlord can write a messgae' do
    signup
    create_space
    sign_out
    sign_up_user_2
    select_space
    create_booking
    sign_out
    visit('/')
    sign_in_user1
    open_booking_1
    fill_in('body', with: 'Hello tenant')
    click_button('Send')
    expect(page).to have_content('Hello tenant')
  end
end
